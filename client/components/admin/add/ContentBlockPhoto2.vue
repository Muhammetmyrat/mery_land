<template>
  <div class="form-example-int form-horizental" style="margin-top: 4vw">
    <div class="form-group">
      <div class="row">
        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
          <div class="nk-int-st">
            <div class="file-upload">
              <button
                class="file-upload-btn"
                type="button"
                onclick="$('.file-upload-input').trigger( 'click' )"
              >
                Surat (1920 x 1076) *
              </button>

              <div class="image-upload-wrap">
                <input
                  class="file-upload-input"
                  type="file"
                  @change="newsPhotoSelect"
                  accept=".jpg, .jpeg, .png"
                  required
                  name="image"
                />
                <div class="drag-text">
                  <h3>Surat ýok <i class="fa fa-upload"></i></h3>
                </div>
              </div>
              <div class="file-upload-content">
                <img
                  class="file-upload-image"
                  src="@/assets/test.jpg"
                  alt="your image"
                />
                <div class="image-title-wrap">
                  <button
                    type="button"
                    onclick="removeUpload()"
                    class="remove-image"
                  >
                    Suraty aýyr
                    <span class="image-title">Uploaded Image</span>
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      image: "",
    };
  },
  methods: {
    async newsPhotoSelect(e) {
      let files = e.target.files || e.dataTransfer.files;
      if (!files.length) return;
      this.image = await files[0];
      this.$emit("changePhoto", this.image);
    },
  },
};
</script>
