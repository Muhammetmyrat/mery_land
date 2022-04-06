<template>
  <div>
    <div class="form-example-int form-horizental" style="margin-top: 4vw">
      <div class="form-group">
        <div class="row">
          <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
            <div class="nk-int-st">
              <input
                @input="updateInputValue"
                :value="value"
                type="text"
                class="form-control input-sm"
                :placeholder="placeHolder"
                name="title_QWER"
              />
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    value: [String, Number],
    placeHolder: String,
  },

  mounted() {
    this.update;
  },

  methods: {
    updateInputValue(event) {
      this.$emit("updateInput", event.target.value);
    },
  },
};
</script>
