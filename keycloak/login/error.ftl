<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
    <#elseif section = "form">
        <div id="kc-error-message">
            <div class="login-logo">
                <div class="logo"></div>
            </div>
            <div class="error-content">
                <h1 class="error-title">${kcSanitize(msg("errorTitle"))?no_esc}</h1>
                <p class="instruction">${kcSanitize(message.summary)?no_esc}</p>
                <#if skipLink??>
                <#else>
                <#if client?? && client.baseUrl?has_content>
                    <p><a id="backToApplication" href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
                </#if>
            </#if>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>