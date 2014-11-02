function AjaxCall() {
    this.WebService;
    this.WebMethod;
    this.Method = "POST";
    this.informationDebug = {};
}

AjaxCall.prototype.URL_TWITTER = "WebService/Twitter.asmx";

AjaxCall.prototype.AddParameter = function (parameterName, parameterValue) {
    this.params[parameterName] = parameterValue;
}
AjaxCall.prototype.AjoutInformationDebug = function (key,val) {
    this.informationDebug[key] = val;
}
AjaxCall.prototype.GetDataString = function () {
    var chaine = "";
    for (var i in this.params) {
        chaine += ", '" + i + "':" + JSON.stringify(this.params[i]).replace(/\/Date\((-?[0-9]+)\)\//g, "\\/Date($1)\\/");
    }
    return "{" + chaine.substring(2) + "}";
}

AjaxCall.prototype.Call = function (successFunction, failFunction, userContext) {
    if (typeof failFunction == 'undefined' || failFunction == null) {
        failFunction = erreur_webservice
    }
    this.AjoutInformationDebug("page", window.document.location.toString());
    this.AjoutInformationDebug("function", arguments.callee.caller.name);
    var tab_arg = arguments.callee.caller.arguments;
    for (var i = 0; i < tab_arg.length; i++) {
        var arg = "";
        if (typeof tab_arg[i] == "undefined") {
            arg = "undefined";
        } else if (typeof tab_arg[i] == "function") {
            arg = tab_arg[i].name;
        } else if (typeof tab_arg[i] == "object") {
            try {
                arg = JSON.stringify(tab_arg[i]);
            } catch (err) {
                arg = err.Message;
            }
        } else {
            arg = tab_arg[i].toString();
        }
        this.AjoutInformationDebug("argument " + i, arg);
    }
    var me = this;
    $.ajax({
        type: this.Method,
        url: this.WebService + "/" + this.WebMethod,
        data: this.GetDataString(),
        contentType: "application/json; charset=utf-8",
        dataType: "text",
        context: userContext,
        success: function (msg) {
            var msg = msg.replace(
                new RegExp('"\\\\\/Date\\\((-?[0-9]+)\\\)\\\\\/"', "g")
                        , "new Date($1)");
            msg = eval('(' + msg + ')');
            successFunction(msg.d, userContext)
        },
        error: function (xhr, ajaxOptions, thrownError) {
            if (xhr.readyState == 0 && xhr.status == 0 && xhr.responseText == "") // Cela veut dire que l'exception est levé car on vient de changer de page
                return;
            var msg_obj = eval('(' + xhr.responseText.replace(
                        new RegExp('"\\\\\/Date\\\((-?[0-9]+)\\\)\\\\\/"', "g")
                                    , "new Date($1)") + ')');
            msg_obj.webservice = me.WebService + "/" + me.WebMethod;
            msg_obj.informationDebug = me.informationDebug;
            failFunction(msg_obj, userContext)
        }
    });

}