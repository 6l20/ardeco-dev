$.postJSON = function(url, data, success, error, args) {
          args = $.extend({
            url: url,
            type: 'POST',
            data: JSON.stringify(data),
            contentType: 'application/json; charset=utf-8',
            crossDomain: true,
            dataType: 'json',
            async: true,
            success: success,
            error: error
          }, args);
          return $.ajax(args);
        };

        $.fn.serializeObject = function()
        {
            var o = {};
            var a = this.serializeArray();
            $.each(a, function() {
                if (o[this.name] !== undefined) {
                    if (!o[this.name].push) {
                        o[this.name] = [o[this.name]];
                    }
                    o[this.name].push(this.value || '');
                } else {
                    o[this.name] = this.value || '';
                }
            });
            return o;
        };

// Noty function to display notifications

function generate(msg, type) {
            var n = noty({
                text        : msg,
                type        : type,
                dismissQueue: false,
                layout      : 'topRight',
                theme       : 'defaultTheme'
            });
            console.log(type + ' - ' + n.options.id);
            return n;
        }