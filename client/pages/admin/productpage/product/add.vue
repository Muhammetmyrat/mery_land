<template>
  <AddContainer>
    <GoBackButton>Back</GoBackButton>
    <ContentBlock>
      <ContentBlockTitle>Slider goşmak</ContentBlockTitle>

      <ContentBlockForm>
        <ContentBlockPhoto @changePhoto="newsPhotoSelect" :img="image" />
        <!------------Text Input------------->
        <ContentBlockTextInput
          v-model="title.tr"
          @updateInput="updateTitleTR"
          :placeHolder="'Harydyň Turkce ady'"
        />
        <ContentBlockTextInput
          v-model="title.ru"
          @updateInput="updateTitleRU"
          :placeHolder="'Harydyň rusca ady'"
        />
        <ContentBlockTextInput
          v-model="title.en"
          @updateInput="updateTitleEN"
          :placeHolder="'Harydyň inlisce ady'"
        />
        <ContentBlockTextArea
          v-model="text.tr"
          @updateTextarea="updateTextTR"
          :placeHolder="'Turkce maglumaty'"
        />
        <ContentBlockTextArea
          v-model="text.ru"
          @updateTextarea="updateTextRU"
          :placeHolder="'rusca maglumaty'"
        />
        <ContentBlockTextArea
          v-model="text.en"
          @updateTextarea="updateTextEN"
          :placeHolder="'inlisce maglumaty'"
        />

        <!-- <ContentBlockTextInput
          v-model="category"
          @updateInput="updateCategory"
        /> -->

        <!--ОСТОРОЖНО !!! КУСОК Г-КОДА-->
        <div>
          <div class="form-example-int form-horizental" style="margin-top: 4vw">
            <div class="form-group">
              <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                  <div class="nk-int-st">
                    <div>
                      <select
                        class="form-select"
                        aria-label="Default select example"
                        v-model="category"
                      >
                        <option
                          v-for="(i, index) in cattArrId"
                          :key="index"
                          :value="i.categories_id"
                        >
                          {{ i.title }}
                        </option>
                      </select>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <ContentBlockSubmitButton>Goş</ContentBlockSubmitButton>
      </ContentBlockForm>
    </ContentBlock>
  </AddContainer>
</template>

<script>
//import "@/assets/css/dashboard/bootstrap-select/bootstrap-select.css";
// import "@/assets/css/dashboard/chosen/style.css";
// import "@/assets/css/dashboard/chosen/prism.css";
// import "@/assets/css/dashboard/chosen/chosen.css";
import { mapGetters, mapActions } from "vuex";
export default {
  layout: "admin",
  head: {
    script: [
      { src: "/admin/chosen/jquery-3.2.1.min.js" },
      { src: "/admin/chosen/chosen.jquery.min.js" },
      { src: "/admin/chosen/prism.js" },
      { src: "/admin/chosen/init.js" },
    ],
  },
  data() {
    return {
      image: "",
      lang_name: ["tr", "ru", "en"],
      title: {
        tr: "",
        ru: "",
        en: "",
      },
      text: {
        tr: "",
        ru: "",
        en: "",
      },
      category: "",
      arrTitle: [],
      arrText: [],
      arr: "",
      cattArrId: "",
    };
  },
  async mounted() {
    await this.fetchAuthToken();
    await this.addNewElement();
    /*-------------------------*/
    await this.fetchDates("get-product-categories");
    await this.takeArr;
    await this.collectCategoriesId({ categories_id: this.arr });
    await this.takeCattArr(this.getCategoriesId);
    /*-------------------------*/
  },

  async updated() {
    // await this.forTextarea();
    await this.changeTitle;
    await this.changeText;
  },

  beforeDestroy() {
    this.destroyCreate();
  },

  computed: {
    ...mapGetters("admin", ["getCategoriesId", "getDates"]),
    takeArr() {
      this.arr = this.getDates;
      console.log("ARR", this.arr);
    },
    //Check and change dates in array
    changeTitle() {
      this.arrTitle[0] = this.title.tr;
      this.arrTitle[1] = this.title.ru;
      this.arrTitle[2] = this.title.en;
    },
    //Check and change dates in array
    changeText() {
      this.arrText[0] = this.text.tr;
      this.arrText[1] = this.text.ru;
      this.arrText[2] = this.text.en;
    },
  },

  methods: {
    ...mapActions("admin", [
      "fetchAuthToken",
      /*-------------------------*/
      "fetchDates",
      /*-------------------------*/
      "fetchGetOneData",
      "deleteOrCreateOrUpdateOneData",
      "collectCategoriesId",
      //"newPhotoSelect",
    ]),

    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/
    newsPhotoSelect(photo) {
      this.image = photo;
    },

    updateTitleTR(update) {
      this.title.tr = update;
    },
    updateTitleRU(update) {
      this.title.ru = update;
    },
    updateTitleEN(update) {
      this.title.en = update;
    },
    //
    updateTextTR(update) {
      this.text.tr = update;
    },
    updateTextRU(update) {
      this.text.ru = update;
    },
    updateTextEN(update) {
      this.text.en = update;
    },
    //
    // updateCategory(update) {
    //   this.category = update;
    // },

    // selectedCat(update) {
    //   this.category = update.target.value;
    // },
    cycleInDates() {
      let formData = new FormData();
      formData.append("image", this.image);
      formData.append("category_id", this.category);

      this.arrTitle.forEach((item, index) => formData.append("title", item));

      this.arrText.forEach((item, index) => formData.append("text", item));

      this.lang_name.forEach((item, index) =>
        formData.append("lang_name", item)
      );

      return formData;
    },

    takeCattArr(some) {
      this.cattArrId = some;
      console.log("WSE GOOD", some);
    },

    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/
    async addNewElement() {
      await this.$nuxt.$on("create", async () => {
        let Dates = await this.cycleInDates();

        this.deleteOrCreateOrUpdateOneData({
          url: "add-products",
          data: Dates,
        });
        console.log("ALL OK");
      });
    },
    destroyCreate() {
      this.$nuxt.$off("create");
    },
  },
};
</script>
<style scoped>
/* @import "https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"; */
</style>
