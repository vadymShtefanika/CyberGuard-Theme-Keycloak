<#import "template.ftl" as layout>
<div class="login-container">
    <div class="login-logo">
        <div class="logo"></div>
    </div>
    <@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
        <#if section = "header">
            Login
        <#elseif section = "form">
            <div id="kc-form">
                <div id="kc-form-wrapper">
                    <#if realm.password>
                        <form id="kc-form-login" onsubmit="login.disabled = true; return true;"
                              action="${url.loginAction}" method="post">
                            <div class="${properties.kcFormGroupClass!}">
                                    <span for="username"
                                          class="label-input"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>Email<#else>${msg("email")}</#if></span>

                                <#if usernameEditDisabled??>
                                    <input placeholder="Email" tabindex="1" id="username"
                                           class="input-login" name="username"
                                           value="${(login.username!'')}" type="text" disabled/>
                                <#else>
                                    <input placeholder="Email" tabindex="1" id="username"
                                           class="input-login" name="username"
                                           value="${(login.username!'')}" type="text" autofocus autocomplete="off"
                                           aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                    />

                                    <#if messagesPerField.existsError('username','password')>
                                        <span id="input-error" class="${properties.kcInputErrorMessageClass!}"
                                              aria-live="polite">
                                    ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                            </span>
                                    </#if>
                                </#if>
                            </div>

                            <div class="${properties.kcFormGroupClass!}">
                                <span for="password" class="label-input">${msg("password")}</span>

                                <input placeholder="Password" tabindex="2" id="password" class="input-login"
                                       name="password" type="password" autocomplete="off"
                                       aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                />
                            </div>

                            <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                                <div id="kc-form-options">
                                    <#if realm.rememberMe && !usernameEditDisabled??>
                                        <div class="checkbox">
                                            <label>
                                                <#if login.rememberMe??>
                                                    <input tabindex="3" id="rememberMe" name="rememberMe"
                                                           type="checkbox" checked> ${msg("rememberMe")}
                                                <#else>
                                                    <input tabindex="3" id="rememberMe" name="rememberMe"
                                                           type="checkbox"> ${msg("rememberMe")}
                                                </#if>
                                            </label>
                                        </div>
                                    </#if>
                                </div>


                            </div>

                            <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                                <input type="hidden" id="id-hidden-input" name="credentialId"
                                       <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                                <input tabindex="4"
                                       class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                                       name="login" id="kc-login" type="submit" value="Login"/>
                            </div>
                        </form>
                    </#if>
                </div>

                <#if realm.password && social.providers??>
                    <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}">
                        <hr/>
                        <h4>${msg("identity-provider-login-label")}</h4>

                        <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountListGridClass!}</#if>">
                            <#list social.providers as p>
                                <a id="social-${p.alias}"
                                   class="${properties.kcFormSocialAccountListButtonClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountGridItem!}</#if>"
                                   type="button" href="${p.loginUrl}">
                                    <#if p.iconClasses?has_content>
                                        <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}"
                                           aria-hidden="true"></i>
                                        <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${p.displayName!}</span>
                                    <#else>
                                        <span class="${properties.kcFormSocialAccountNameClass!}">${p.displayName!}</span>
                                    </#if>
                                </a>
                            </#list>
                        </ul>
                    </div>
                </#if>

            </div>
        <#elseif section = "info" >
            <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                <div id="kc-registration-container">
                    <div id="kc-registration">
                    <span>${msg("noAccount")} <a tabindex="6"
                                                 href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                    </div>
                </div>
            </#if>
        </#if>
    </@layout.registrationLayout>
</div>