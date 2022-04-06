<template>
  <div class="limiter">
    <MainForm>
      <FormHeader :title="'Täze parolyňyzy giriziň'" />
      <!-- <div class="alert alert-danger">
            <li align="center" style="list-style: none">qwer</li>
          </div> -->
      <LogInput :type="'password'" :dataPlace="'Password'" />
      <LogButton :title="'Indiki'" />
    </MainForm>
  </div>
</template>

<script>
export default {
  layout: "login",
};
</script>
