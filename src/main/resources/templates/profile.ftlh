<#import "parts/common.ftlh" as c>
<@c.page>
    <h5>${username}</h5>
    ${message?if_exists}
    <form method="post">
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label"> Password: </label>
            <div class="col-sm-6"><input class="form-control" type="password" name="password" placeholder="Password"/>
            </div>
        </div>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label"> Email: </label>
            <div class="col-sm-6">
                <input class="form-control" type="email" name="email" value="${email!''}" placeholder="some@some.com"/>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary" type="submit">Save</button>
    </form>
</@c.page>
