/**
 * menu_operations
 * @author Vladimir Shestakov <boolive@yandex.ru>
 * @version 1.0
 */
(function($, WidgetJS, undefined) {
    WidgetJS.define('menu_operations', 'Widget', {
        /** @var string|undefined URI of current object */
        object: undefined,
        uri: undefined,
        loader: undefined,

        create: function () {
            this._super('Widget').create.call(this);
            this.uri = this.$element.attr('data-uri');
        },
        /**
         * Show menu and loading items
         * @param caller
         * @param info
         */
        on_showObjectOperations: function(caller, info){
            var self = this;
            if (typeof this.object !== 'undefined'){
                self.emit('hideObjectOperations', [{object:self.object}], null, true);
            }
            self.object = info.object;
            self.loadMenu();
            self.$element.css({top: info.pos.top, left: info.pos.left, display:'block'});
            $(document).one('click', function(){
                self.emit('hideObjectOperations', [{object:self.object}], null, true);
            });
        },
        /**
         * Hide menu
         * @param caller
         * @param info
         */
        on_hideObjectOperations: function(caller, info){
            this.$element.css('display', 'none');
            this.object = undefined;
        },

        loadMenu: function(){
            var self = this;
            self.$element.html('...');
            this.loader = $.ajax({
                method: 'POST',
                data: {
                    object: this.object,
                    form: this.uri
                }
            }).done(function(data){

                // Название корневого тега
                var expr = new RegExp('<[a-z]+.*data-widget=[\'"]menu_operations[\'"].*>');
                var tag = expr.exec(data);
                if (tag && tag.length==1){
                    tag = tag[0];
                    // Оставляем только вложенные теги
                    expr = new RegExp(tag+'([\\s\\S]*)<\/div>[\\s\\S]*');
                    var html = data.replace(expr, '$1');
                    // Обратный вызов перед очисткой элемента
                    //if ('empty' in settings && _.isFunction(settings.empty)){
                    //    settings.empty();
                    //}
                    self.$element.html(html);
                }
            })
        }

        ///**
        // * Обновление html виджета с сервера
        // * @param data POST данные запроса
        // * @param settings Дополнительные парметры ajax запроса и функции обратного вызова как в $.ajax()
        // */
        //reload: function(data, settings){
        //    var self = this;
        //    if (_.isFunction(settings)){
        //        settings = {success:settings};
        //    }else
        //    if (!_.isObject(settings)){
        //        settings = {};
        //    }
        //    var success = _.isFunction(settings.success)? settings.success : null;
        //    settings.owner = self.widgetName;
        //    settings.context = self.element;
        //    settings.type = 'POST';
        //    settings.data = settings.data? _.extend(settings.data, data) : data;
        //    settings.data.direct = self.options.view;
        //    settings.dataType = 'json';
        //    settings.success = function(result, textStatus, jqXHR){
        //        // Название корневого тега
        //        var expr = new RegExp('<[a-z]+.*data-v=[\'"]'+self.options.view+'[\'"].*>');
        //        var tag = expr.exec(result.out);
        //        if (tag && tag.length==1){
        //            tag = tag[0];
        //            // Оставляем только вложенные теги
        //            expr = new RegExp(tag+'([\\s\\S]*)<\/div>[\\s\\S]*');
        //            var html = result.out.replace(expr, '$1');
        //            // Обратный вызов перед очисткой элемента
        //            if ('empty' in settings && _.isFunction(settings.empty)){
        //                settings.empty();
        //            }
        //            self.element.html(html);
        //        }
        //        // Подключение файлов css и js. После их подключения обновляется HTML виджета
        //        if (!result.links) result.links = [];
        //        $.include(result.links, function(){
        //            // Вызов события изменения HTML. Будут подключаться jquery плагины к загруженному html
        //            $(document).trigger('load-html', [self.element]);
        //            // Обратный вызов при удачном обновлении виджета
        //            if (success) success(result, textStatus, jqXHR);
        //        });
        //    };
        //    $.ajax(settings);
        //}
    });
})(jQuery, WidgetJS);