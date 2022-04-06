<template>
  <div class="wrap-input100 validate-input">
    <!-- <span class="btn-show-pass">
        <i class="zmdi zmdi-eye"></i>
      </span> -->
    <input
      @input="focusInput"
      class="input100"
      :type="type"
      v-model="inputValue"
      :value="value"
      name="email"
    />
    <span
      ref="span"
      class="focus-input100"
      :data-placeholder="dataPlace"
    ></span>
  </div>
</template>

<script>
export default {
  props: {
    type: {
      type: String,
      required: true,
    },
    dataPlace: {
      type: String,
      required: true,
    },
    value: [String, Number],
  },
  data() {
    return {
      inputValue: "",
    };
  },

  // mounted() {
  //   this.focusInput();
  // },
  methods: {
    //For Update value and remove placeholder
    focusInput(event) {
      if (this.inputValue != "") {
        this.$refs.span.removeAttribute("data-placeholder");
      } else if (this.inputValue == "") {
        this.$refs.span.setAttribute("data-placeholder", this.dataPlace);
      }
      this.$emit("updateInput", event.target.value);
    },
    // updateInput(event) {
    //   this.$emit("updateInput", event.target.value);
    // },
    // else if (this.inputData == "") {
    //   this.$refs.span.setAttribute("data-placeholder", this.dataPlace);
    // }
    // updateInputValue(event) {
    //   this.$emit("updateInput", event.target.value);
    // },
  },

  //Take props:{value} and compare with data:{inputValue}
};
</script>
