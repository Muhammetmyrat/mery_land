<template>
  <div class="normal-table-area">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 bg-wt">
          <div class="normal-table-list mg-t-30">
            <slot></slot>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<style scoped>
.bg-wt {
  padding: 20px !important;
  background: #fff !important;
}
</style>
