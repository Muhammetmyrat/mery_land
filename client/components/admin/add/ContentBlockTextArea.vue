<template>
  <div>
    <div class="form-example-int form-horizental" style="margin-top: 4vw">
      <div class="form-group">
        <div class="row">
          <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
            <div class="nk-int-st">
              <ckeditor
                :editor="editor"
                :config="editorConfig"
                @input="emitValue"
                v-model="textAreaValue"
                :value="value"
                name="content_"
                rows="9"
                class="form-control"
              >
              </ckeditor>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
let ClassicEditor;
let CKEditor;

if (process.client) {
  ClassicEditor = require("@ckeditor/ckeditor5-build-classic");
  CKEditor = require("@ckeditor/ckeditor5-vue2");
} else {
  CKEditor = { component: { template: "<div></div>" } };
}
export default {
  components: {
    ckeditor: CKEditor.component,
  },
  props: {
    value: [String, Number],
    placeHolder: String,
  },
  updated() {
    this.updateTextArea;
  },
  data() {
    return {
      editor: ClassicEditor,
      editorConfig: {
        placeholder: this.placeHolder,
        // The configuration of the editor.
      },
      textAreaValue: "",
    };
  },
  computed: {
    updateTextArea() {
      this.textAreaValue = this.value;
    },
  },
  methods: {
    emitValue(event) {
      this.$emit("updateTextarea", event);
      console.log("EVENT", event);
    },
  },
};
</script>
