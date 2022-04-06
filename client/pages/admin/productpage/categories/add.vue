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
          :placeHolder="'Kategoriýanyň Turkce ady'"
        />
        <ContentBlockTextInput
          v-model="title.ru"
          @updateInput="updateTitleRU"
          :placeHolder="'Kategoriýanyň rusca ady'"
        />
        <ContentBlockTextInput
          v-model="title.en"
          @updateInput="updateTitleEN"
          :placeHolder="'Kategoriýanyň inlisce ady'"
        />
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
      lang_name: ["tr", "ru", "en"],
      image: null,
      title: {
        tr: "",
        ru: "",
        en: "",
      },
      sliderTitle: [],
    };
  },
  async mounted() {
    await this.fetchAuthToken();
    await this.addNewElement();
  },
  async updated() {
    await this.changeTitle;
  },
  beforeDestroy() {
    this.destroyCreate();
  },
  computed: {
    changeTitle() {
      this.sliderTitle[0] = this.title.tr;
      this.sliderTitle[1] = this.title.ru;
      this.sliderTitle[2] = this.title.en;
    },
  },
  methods: {
    ...mapActions("admin", ["fetchAuthToken", "deleteOrCreateOrUpdateOneData"]),

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

    // forInOneTime(arr, key) {
    //   for (let i in arr) {
    //     this[key][arr[i].lang_name] = arr[i][key];
    //   }
    // },
    // forInDates(some) {
    //   this.image = some.data.data[0].image_path;
    //   this.forInOneTime(slidDates, "title");
    // },

    cycleInDates() {
      let formData = new FormData();
      formData.append("image", this.image);
      this.lang_name.forEach((item, index) =>
        formData.append("lang_name", item)
      );

      this.sliderTitle.forEach((item, index) => formData.append("name", item));

      return formData;
    },

    async addNewElement() {
      await this.$nuxt.$on("create", async () => {
        let Dates = await this.cycleInDates();

        this.deleteOrCreateOrUpdateOneData({
          url: "add-product-categories",
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
