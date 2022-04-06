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
        />
        <ContentBlockTextInput
          v-model="title.ru"
          @updateInput="updateTitleRU"
        />
        <ContentBlockTextInput
          v-model="title.en"
          @updateInput="updateTitleEN"
        />
        <ContentBlockTextArea
          v-model="text.tr"
          @updateTextarea="updateTextTR"
        />
        <ContentBlockTextArea
          v-model="text.ru"
          @updateTextarea="updateTextRU"
        />
        <ContentBlockTextArea
          v-model="text.en"
          @updateTextarea="updateTextEN"
        />
        <!-- 
        <ContentBlockTextInput
          v-model="category"
          @updateInput="updateCategory"
        /> -->

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
                        v-model="category_id"
                      >
                        <option disabled value="">{{ category_name }}</option>

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
import { mapGetters, mapActions } from "vuex";
export default {
  layout: "admin",

  data() {
    return {
      image: "",
      lang_name: ["tr", "ru", "en"],
      product_id: "",
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
      category_id: "",
      category_name: "",

      item_id: "",
      arrTitle: [],
      arrText: [],
      arr: "",
      cattArrId: "",
    };
  },

  async mounted() {
    await this.fetchAuthToken();
    await this.fetchGetOneData({ url: `get-products/${this.id}` });
    await this.forInDates(this.getGetteredDates);

    /*-------------------------*/
    await this.fetchDates("get-product-categories");
    await this.takeArr;
    await this.collectCategoriesId({ categories_id: this.arr });
    await this.takeCattArr(this.getCategoriesId);
    /*-------------------------*/
    await this.addNewElement();
  },

  async updated() {
    await this.changeTitle;
    await this.changeText;
  },
  beforeDestroy() {
    this.destroyCreate();
  },
  computed: {
    ...mapGetters("admin", ["getGetteredDates", "getCategoriesId", "getDates"]),
    takeArr() {
      this.arr = this.getDates;
      console.log("ARR", this.arr);
    },
    id() {
      return this.$route.params.id;
    },
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
    ]),
    /**--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/

    forInOneTime(arr, key) {
      for (let i in arr) {
        this[key][arr[i].lang_name] = arr[i][key];
      }
    },
    forInDates(some) {
      let Dates = some.data.data;
      this.image = Dates[0].image_path;
      this.category_name = Dates[0].category_name;
      this.category_id = Dates[0].category_id;

      this.forInOneTime(Dates, "title");
      this.forInOneTime(Dates, "text");

      for (let i in Dates) {
        this.item_id = [...this.item_id, Dates[i].id];
      }

      return Dates;
    },

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
    updateCategory(update) {
      this.category_id = update;
    },

    cycleInDates() {
      let formData = new FormData();
      formData.append("image", this.image);
      formData.append("product_id", this.id);
      formData.append("category_id", this.category_id);

      this.arrTitle.forEach((item, index) => formData.append("title", item));

      this.arrText.forEach((item, index) => formData.append("text", item));

      this.item_id.forEach((item, index) => formData.append("id", item));

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
          url: "save-products",
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
