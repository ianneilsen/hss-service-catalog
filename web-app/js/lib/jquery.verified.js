/* 
Meta:
  Author: <Chaobin Tang ctang@redhat.com>
  Version: 0.3
  Plugin name: verified
  Description: This plugin automatically checks all fields in a selector and
  stop the submission on invalid values with proper UI prompt.

Change log -
  0.3 2012-11-15 Added one class that manages field verifications.
  0.2 2012-11-11 Extended the verifiers expressions, now supports several verifiers
  0.1 2012-11-1  Initially write the plugin only checking required field.
*/

(function ($) {

    $.fn.verified = function(options) {

        var userOptions = options || {};

        var defaultOptions = {
            klass: 'verified',
            theme: '_prompt', // Class name of prompt widget
            fieldTheme: {
              success: '',
              failed: ''
            },
            verifiersHolder: 'verifiers',
            prompt: { // Messages to display for each verifier
                required: 'This is required.',
                nan: 'Not a number.',
                gt: 'Should be greater than',
                gte: 'Should be greater/equal than',
                lt: 'Should be smaller than',
                lte: 'Should be smaller/equal than',
                equal: 'Should be equal to',
                notEqual: 'Should not be equal to',
                contains: 'Should contain',
                excludes: 'Should not contain',
                minLength: 'Length should at least be',
                maxLength: 'Length should not be larger than',
                maxWords: 'Length in words should not be larger than',
                match: 'Does not match the format'
            },
            css: {
                'font-weight': 'bold',
                'padding-left': '5px',
                'color': 'red',
                'font-size': '13px',
            },
            verifiers: {}, // Extra verifiers defined by user
            tokenizer: '=' // Used in the verify-expression to tokenize verifier and arguments
        };
        var settings = $.extend(defaultOptions, userOptions);

        function makeMsg(msgKey, v) {
            var msg = settings.prompt[msgKey];
            return (typeof(v) == 'undefined') ? msg : [msg, v].join(' ');
        }

        var Verifiers = {
            /*
            Every verifier should either return `true`
            or a message string indicates a failed check,
            and the message is to be prompted.
            The verifier should skip by returning `true` directly
            when the verify-expression is invalid.
            */

            _ptns: {
                space: /\s+/,
            },

            _numOrNull: function(n) {
                var _n = parseFloat(n); // Should work for both integers and decimals
                return isNaN(_n) ? null : _n;
            },

            required: function(v) {
                // The field can't be empty
                return v ? true: makeMsg('required');
            },

            equal: function(v, c) {
                return (v == c) ? true : makeMsg('equal', c);
            },

            notEqual: function(v, c) {
                return (v != c) ? true: makeMsg('notEqual', c);
            },

            lte: function(v, c) {
                // Value should be less or equal than the value specified in verify-exp
                if ( v == "" ) { // Skip if user did not give anything
                    return true;
                }
                var _v = Verifiers._numOrNull(v);
                if ( _v == null ) {
                    return settings.prompt.nan;
                }
                var _c = Verifiers._numOrNull(c);
                if ( _c == null ) {
                    // Skip this check on invalid config
                    return true;
                }
                return (_v <= _c) ? true: makeMsg('lte', c);
            },

            gte: function(v, c) {
                // Value should be greater than value specified in verify-exp
                if ( v == "" ) { // Skip if user did not give anything
                    return true;
                }
                var _v = Verifiers._numOrNull(v);
                if ( _v == null ) {
                    return settings.prompt.nan;
                }
                var _c = Verifiers._numOrNull(c);
                if ( _c == null ) {
                    // Skip this check on invalid config
                    return true;
                }
                return (_v >= _c) ? true: makeMsg('gte', c);
            },

            lt: function(v, c) {
                // Value should be less or equal than the value specified in verify-exp
                if ( v == "" ) { // Skip if user did not give anything
                    return true;
                }
                var _v = Verifiers._numOrNull(v);
                if ( _v == null ) {
                    return settings.prompt.nan;
                }
                var _c = Verifiers._numOrNull(c);
                if ( _c == null ) {
                    // Skip this check on invalid config
                    return true;
                }
                return (_v < _c) ? true: makeMsg('lt', c);
            },

            gt: function(v, c) {
                // Value should be less or equal than the value specified in verify-exp
                if ( v == "" ) { // Skip if user did not give anything
                    return true;
                }
                var _v = Verifiers._numOrNull(v);
                if ( _v == null ) {
                    return settings.prompt.nan;
                }
                var _c = Verifiers._numOrNull(c);
                if ( _c == null ) {
                    // Skip this check on invalid config
                    return true;
                }
                return (_v > _c) ? true: makeMsg('gt', c);
            },

            minLength: function(v, c) {
                var _c = Verifiers._numOrNull(c);
                if ( _c == null ) {
                    return true;
                }
                return (v.length >= _c) ? true : makeMsg('minLength', c);
            },

            maxLength: function(v, c) {
                var _c = Verifiers._numOrNull(c);
                if ( _c == null ) {
                    return true;
                }
                return (v.length <= _c) ? true: makeMsg('maxLength', c);
            },

            maxWords: function(v, c) {
                var _c = Verifiers._numOrNull(c);
                if ( _c == null ) {
                    return true;
                }
                var words = v.split(Verifiers._ptns.space);
                return (words.length <= _c) ? true: makeMsg('maxWords', c);
            },

            contains: function(v, c) {
                return (v.search(c) > 0) ? true : makeMsg('contains', c);
            },

            excludes: function(v, c) {
                return (v.search(c) < 0) ? true : makeMsg('excludes', c);
            },

            match: function(v, c) {
                return (v.match(c) != null) ? true: makeMsg('match', c);
            },

            isDigit: function(v) {
                var _v = Verifiers._numOrNull(v);
                return (_v != null) ? true : makeMsg('isDigit');
            },

            isEmail: function(v) {
                // TODO implementation
            },

            isCell: function() {
                // TODO implementation
            },

            isTel: function() {
                // TODO implementation
            }
        };

        $.extend(Verifiers, ('verifiers' in options) ? options : {});

        var VerifiedField = function (field) {
            /* class that manages a verified field. */

            this.field = $(field);

            this.updateVerifiers = function(expressions) {
                var expressionString = expressions.join(' ');
                this.field.attr(settings.verifiersHolder, expressionString);
            }

            this.addVerifier = function(vName, value) {
                if ( ! vName in Verifiers ) { // Invalid exp
                    return false;
                }
                if ( ! this.field.attr(settings.verifiersHolder) ) {
                    this.field.attr(settings.verifiersHolder, '');
                }
                var expressions = this.field.attr(settings.verifiersHolder).split(/\s+/);
                for ( index in expressions ) {
                    var _exp = expressions[index];
                    var _tokens = _exp.split(settings.tokenizer);
                    var _verifier = _tokens[0];
                    if ( _verifier == vName ) { // This verifier already exists
                        expressions.pop(_exp); // Remove it and stop
                        break;
                    }
                }
                var exp = ( typeof(value) != 'undefined' ) ? [vName, value].join(settings.tokenizer) : vName ;
                expressions.push(exp);
                this.updateVerifiers(expressions);
            }

            this.removeVerifier = function(vName) {
                if ( ! this.field.attr(settings.verifiersHolder) ) {
                    return false;
                }
                var expressions = this.field.attr(settings.verifiersHolder).split(/\s+/);
                for ( index in expressions ) {
                    var _exp = expressions[index];
                    var _tokens = _exp.split(settings.tokenizer);
                    var _verifier = _tokens[0];
                    if ( _verifier == vName ) {
                        expressions.pop(_exp);
                        break;
                    }
                }
                this.updateVerifiers(expressions);
            }

            this.verifyOn = function() {
                this.field.addClass(settings.klass);
            }

            this.verifyOff = function() {
                this.field.removeClass(settings.klass);
            }
        };

        var Regulator = {

            template: null,

            getTemplate: function(field) {
                if ( this.template == null ) {
                    var widget = $('<span></span').hide();
                    if (! userOptions.theme) {
                      widget.css(settings.css); // If theme is not overridden, apply default CSS
                    }
                    this.template = widget; // Cache the template
                }
                var promptWidget = this.template.clone().addClass(settings.theme);
                var className = (field.attr('name')+'Prompt');
                promptWidget.addClass(className);
                return promptWidget;
            },

            replaceAll: function(selector) {
                // Initiallly set up all fields.
                var containingCls = this;
                var fields = containingCls.fieldsVerified(selector);
                fields.each(function(index, item) {
                    var field = $(item);
                    if ( ! field.hasClass('_verified') ) {
                        var promptWidget = containingCls.getTemplate(field);
                        promptWidget.insertAfter(field);
                        field.addClass('_verified');
                    }
                });
            },

            fieldsVerified: function(selector) {
                var fields = selector.find('.'+settings.klass);
                return fields;
            },

            getPromptWidget: function(field) {
                return field.siblings('.'+field.attr('name')+'Prompt');
            },

            prompt: function(field, prmt) {
                // Render UI prompt when check failed.
                field.addClass(settings.fieldTheme.failed).removeClass(settings.fieldTheme.success);
                var promptWidget = this.getPromptWidget(field);
                promptWidget.text(prmt).show();
            },

            hidePrompt: function(field) {
                var promptWidget = this.getPromptWidget(field);
                promptWidget.text('').hide();
            },

            parseExp: function(field) {
                /* Parse from tag attr `verifiers` all the
                specified verifiers.
                */
                function parse(exp) {
                    /* Wrote on a train, might be confusing here (2012-11-10) */
                    var tokens = exp.split(settings.tokenizer);
                    if ( tokens.length == 2 ) { // Expressions currently only support one argument
                        var verifierName = tokens[0];
                        var rValue = tokens[1];
                    } else if ( tokens.length == 1 ) { // Indicates this verifier doesn't take value to compute with
                        var verifierName = tokens[0];
                        var rValue = null;
                    }
                    verifier = (verifierName in Verifiers) ? Verifiers[verifierName] : null;
                    return [verifier, rValue];
                }
                var cleaners = [];
                var expressions = field.attr(settings.verifiersHolder);
                if ( ! expressions ) {
                    return;
                }
                expressions = expressions.split(/\s+/);
                if ( expressions.length == 0 ) {
                    return;
                }
                for ( index in expressions ) {
                    var cleaner = parse(expressions[index]);
                    verifier = cleaner[0];
                    if ( verifier == null ) {
                        continue;
                    }
                    cleaners.push(cleaner);
                }
                return cleaners;
            },

            sanitize: function(field) {
                /*
                - 1. Get all verifiers specifed.
                - 2. Iterate the verifiers and run them
                -    one by one, always stops at the first
                -    failure.
                - 3. Finally return true/false indicates the result.
                */
                var containingCls = this;
                var result = true;
                var cleaners = this.parseExp(field);
                if ( ! cleaners || cleaners.length == 0 ) { // No verifiers specified
                    return true;
                }
                for ( index in cleaners ) {
                    var cleaner = cleaners[index];
                    var funcClean = cleaner[0];
                    var rValue = cleaner[1];
                    var lValue = field.val();
                    if ( rValue == null ) {
                        _result = funcClean(lValue);
                    } else {
                        _result = funcClean(lValue, rValue);
                    }
                    if ( typeof(_result) != "boolean" ) {
                        result = false;
                        containingCls.prompt(field, _result);
                        break;
                    } else if ( ! result ) {
                        result = _result;
                        break;
                    }
                }
                if ( result ) { // Hide prompt when sanitized good
                    this.hidePrompt(field);
                    field.addClass(settings.fieldTheme.success).removeClass(settings.fieldTheme.failed);
                }
                return result;
            },

            run: function(selector) {
                /* The regulator. */
                var result = true;
                var containingCls = this;
                var fields = this.fieldsVerified(selector);
                if ( fields.length == 0 ) {
                    return true;
                }
                fields.each(function(index, field) {
                    _result = containingCls.sanitize($(field));
                    if ( ! _result ) {
                        result = false;
                    }
                });
                return result;
            },

            onSubmit: function(selector) {
                // Basically an event binder.
                var containingCls = this;
                $(selector).live('submit', function() {
                    var result = containingCls.run($(this));
                    return result;
                });
            },

            onBlur: function(selector) {
                // Basically an event binder.
                var containingCls = this;
                var fields = containingCls.fieldsVerified(selector);
                fields.live('blur', function() {
                    var result = containingCls.sanitize($(this));
                    return result;
                });
            },

            setup: function(selector) {
                this.replaceAll(selector);
                this.onSubmit(selector);
                this.onBlur(selector);
            }
        };

        var target = this;

        function setup(target) {
            if ( $(target).hasClass(settings.klass) ) { // Indicates this is a verified field
                return new VerifiedField( $(target) );
            } else { // A verified form
                var form = target;
                Regulator.setup(form);
                form.isValid = function() {
                    return Regulator.run(form);
                }
                return form;
            }
        }

        return setup(target); // Maintains the chainability by finnaly returning the jQ object.
    }

})(jQuery);
