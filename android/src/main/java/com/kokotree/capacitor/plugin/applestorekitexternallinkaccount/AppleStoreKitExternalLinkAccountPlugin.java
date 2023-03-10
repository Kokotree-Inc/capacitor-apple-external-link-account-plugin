package com.kokotree.capacitor.plugin.applestorekitexternallinkaccount;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "AppleStoreKitExternalLinkAccount")
public class AppleStoreKitExternalLinkAccountPlugin extends Plugin {

    private AppleStoreKitExternalLinkAccount implementation = new AppleStoreKitExternalLinkAccount();

    @PluginMethod
    public void echo(PluginCall call) {
        String value = call.getString("value");

        JSObject ret = new JSObject();
        ret.put("value", implementation.echo(value));
        call.resolve(ret);
    }
}
