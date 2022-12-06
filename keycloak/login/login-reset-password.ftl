<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo = true displayMessage=!messagesPerField.existsError('username'); section>
        <#if section = "header">
        <#elseif section = "form">
            <form id="kc-reset-password-form" class="${properties.kcFormClass!}"  action="${url.loginAction}" method="post">
                <div class="login-logo">
                    <div class="logo"></div>
                </div>
                <div class="${properties.kcFormGroupClass!}">
                    <div id="forgot-title">${msg("Forgot password")}</div>
                    <div id="forgot-input" class = "${properties.kcFormGroupClass!}">
                        <#if auth?has_content && auth.showUsername()>
                            <label class="login-form-input-label">${msg("Email")}</label>
                            <input type="text" placeholder=${msg("Username or email")} id="username" name="username" class="${properties.kcInputClass!}" autocomplete="off" autofocus value="${auth.attemptedUsername}"aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"/>

                            <#else>
                            <label class="login-form-input-label">${msg("Username or email")}</label>
                            <input type="text" id="username" name="username" class="${properties.kcInputClass!}" autocomplete="off" autofocus placeholder=${msg("Username or email")} aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"/>
                        </#if>

                        <#if messagesPerField.existsError('username')>
                            <div id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                        ${kcSanitize(messagesPerField.get('username'))?no_esc}
                            </div>
                        </#if>
                    </div>

                    <div id="kc-form-buttons" >
                        <input class="${properties.kcButtonClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}"/>
                    </div>
                </div>

            </form>
        <#elseif section = "info" >
        </#if>
</@layout.registrationLayout>