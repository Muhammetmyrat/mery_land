<template>
  <client-only>
    <div class="form-example-int form-horizental" style="margin-top: 4vw">
      <div class="form-group">
        <div class="row">
          <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
            <img
              :src="`${url}${image}`"
              style="max-width: 100%; height: auto"
            />
          </div>
          <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
            <div class="nk-int-st">
              <div class="file-upload">
                <button class="file-upload-btn" type="button">
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
                  <img class="file-upload-image" alt="your image" />
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
  </client-only>
</template>
<script>
export default {
  props: {
    img: { required: true },
  },
  data() {
    return {
      image: "",
      url: "/_nuxt/assets/test.jpg",
    };
  },
  // created() {
  //   this.takePhoto;
  // },
  watch: {
    img: function () {
      console.log("updated");
      this.takePhoto();
    },
  },

  // computed: {
  //   async takePhoto() {
  //     console.log(this.img);
  //     if (typeof this.img == "string") {
  //       console.log("sss", typeof this.img);
  //       this.url = "http://10.192.3.70:3000/api";
  //       this.image = await this.img;
  //       console.log("UPS 1");
  //     } else if (typeof this.img == "object" && this.img !== null) {
  //       console.log("rrr", typeof this.img);
  //       console.log("UPS 2");
  //       let reader = new FileReader();
  //       reader.onload = (e) => {
  //         this.image = e.target.result;
  //       };
  //       reader.readAsDataURL(this.img);
  //       this.url = "";
  //     } else {
  //       console.log("UPS 3");
  //       this.url = "";
  //       this.image = "/_nuxt/assets/test.jpg";
  //     }
  //   },
  // },
  methods: {
    async takePhoto() {
      console.log(this.img);
      if (typeof this.img == "string") {
        console.log("sss", typeof this.img);
        this.url = "http://10.192.1.52:3000/api";
        this.image = await this.img;
        console.log("UPS 1");
      } else if (typeof this.img == "object" && this.img !== null) {
        console.log("rrr", typeof this.img);
        console.log("UPS 2");
        let reader = new FileReader();
        reader.onload = (e) => {
          this.image = e.target.result;
        };
        reader.readAsDataURL(this.img);
        this.url = "";
      } else {
        console.log("UPS 3");
        this.url = "";
        this.image = "/_nuxt/assets/test.jpg";
      }
    },
    async newsPhotoSelect(e) {
      //this.image = e.target.files[0].name;
      let files = e.target.files || e.dataTransfer.files;
      if (!files.length) return;
      this.image = await files[0];
      this.$emit("changePhoto", this.image);

      // await this.fileUpload(files[0]);
      // this.$emit("changePhoto", this.image);
    },
    // fileUpload(filePart,fileName) {
    //   let reader = new FileReader();
    //   // reader.onload = (e) => {
    //   //   this.image = e.target.result;
    //   // };
    //   reader.readAsDataURL(fileName);
    //   console.log(file);
    // },
  },
};
</script>
