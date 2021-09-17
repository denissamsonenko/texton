<#macro login path isRegisterForm>

    <form action="${path}" method="post" xmlns="http://www.w3.org/1999/html">
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">User Name : </label>
            <div class="col-sm-6">
                <input class="form-control ${(usernameError??)?string('is-invalid', '')}"
                       value="<#if user??>${user.username}</#if>" type="text" name="username" placeholder="User name"/>
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
            </div>
        </div>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label"> Password: </label>
            <div class="col-sm-6">
                <input class="form-control ${(passwordError??)?string('is-invalid', '')}" type="password"
                       name="password" placeholder="Password"/>
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </div>
        </div>
        <#if isRegisterForm>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label"> Password: </label>
                <div class="col-sm-6">
                    <input class="form-control ${(password2Error??)?string('is-invalid', '')}" type="password"
                           name="password2" placeholder="Password"/>
                    <#if password2Error??>
                        <div class="invalid-feedback">
                            ${password2Error}
                        </div>
                    </#if>
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label"> Email: </label>
                <div class="col-sm-6">
                    <input class="form-control ${(emailError??)?string('is-invalid', '')}" type="email" name="email"
                           value="<#if user??>${user.email}</#if>" placeholder="some@some.com"/>
                    <#if emailError??>
                        <div class="invalid-feedback">
                            ${emailError}
                        </div>
                    </#if>
                </div>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <#if !isRegisterForm><a href="/registration">Add new user</a></#if>
        <button class="btn btn-primary" type="submit"><#if isRegisterForm>Create<#else>Sign In</#if></button>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary" type="submit"><#if user??>Sign Out<#else>Log in</#if></button>
    </form>
</#macro>