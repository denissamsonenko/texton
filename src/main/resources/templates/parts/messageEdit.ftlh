<a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
   aria-controls="collapseExample">
    Message Edit
</a>
<div class="collapse <#if message??>show</#if>" id="collapseExample">
    <div class="form-group">
        <form method="post" enctype="multipart/form-data">
            <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                   value="<#if message??>${message.text}</#if>" name="text" placeholder="Input text"/>
            <#if textError??>
                <div class="invalid-feedback">
                    ${textError}
                </div>
            </#if>
            <input class="form-control ${(tagError??)?string('is-invalid', '')}"
                   value="<#if message??>${message.tag}</#if>" type="text" name="tag" placeholder="tag"/>
            <#if tagError??>
                <div class="invalid-feedback">
                    ${tagError}
                </div>
            </#if>
            <div class="custom-file">
                <input type="file" name="file" class="custom-file-input" id="customFile">
                <label class="custom-file-label" for="customFile">Choose file</label>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <input type="hidden" name="id" value="<#if message??>${message.id}<#else>-1</#if>"/>
            <button class="btn btn-primary" type="submit">Save message</button>
        </form>
    </div>
</div>