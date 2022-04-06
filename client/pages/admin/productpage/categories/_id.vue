<template>
  <AddContainer>
    <GoBackButton>Back</GoBackButton>
    <ContentBlock>
      <ContentBlockTitle>Slider goşmak</ContentBlockTitle>
      <ContentBlockForm>
        <ContentBlockPhoto @changePhoto="newsPhotoSelect" :img="image" />
        <!------------Text Input------------->
        <ContentBlockTextInput
          v-model="name.tr"
          @updateInput="updateTitleTR"
          :placeHolder="'Kategoriýanyň Turkce ady'"
        />
        <ContentBlockTextInput
          v-model="name.ru"
          @updateInput="updateTitleRU"
          :placeHolder="'Kategoriýanyň rusca ady'"
        />
        <ContentBlockTextInput
          v-model="name.en"
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
      id2: "",
      image: null,
      name: {
        tr: "",
        ru: "",
        en: "",
      },
      sliderTitle: [],
    };
  },

  async mounted() {
    await this.fetchAuthToken();
    await this.fetchGetOneData({ url: `get-product-categories/${this.id}` });
    await this.forInDates(this.getGetteredDates);
    await this.addNewElement();
  },
  async updated() {
    await this.changeTitle;
  },
  beforeDestroy() {
    this.destroyCreate();
  },
  computed: {
    ...mapGetters("admin", ["getGetteredDates"]),

    id() {
      return this.$route.params.id;
    },
    changeTitle() {
      this.sliderTitle[0] = this.name.tr;
      this.sliderTitle[1] = this.name.ru;
      this.sliderTitle[2] = this.name.en;
    },
  },

  methods: {
    ...mapActions("admin", [
      "fetchAuthToken",
      "fetchGetOneData",
      "deleteOrCreateOrUpdateOneData",
    ]),

    newsPhotoSelect(photo) {
      this.image = photo;
    },

    updateTitleTR(update) {
      this.name.tr = update;
    },
    updateTitleRU(update) {
      this.name.ru = update;
    },
    updateTitleEN(update) {
      this.name.en = update;
    },
    /*----------------Update texts-------------------*/

    forInOneTime(arr, key) {
      for (let i in arr) {
        this[key][arr[i].lang_name] = arr[i][key];
      }
    },
    forInDates(some) {
      let Dates = some.data.data;
      this.image = some.data.data[0].image_path;
      // this.id2 = some.data.data[0].id;
      for (let i in Dates) {
        this.id2 = [...this.id2, Dates[i].id];
      }
      this.forInOneTime(Dates, "name");
    },

    cycleInDates() {
      let formData = new FormData();
      formData.append("category_id", this.id);
      formData.append("image", this.image);
      this.id2.forEach((item, index) => formData.append("id", item));
      this.sliderTitle.forEach((item, index) => formData.append("name", item));
      this.lang_name.forEach((item, index) =>
        formData.append("lang_name", item)
      );
      return formData;
    },

    async addNewElement() {
      await this.$nuxt.$on("create", async () => {
        let Dates = await this.cycleInDates();

        this.deleteOrCreateOrUpdateOneData({
          url: "save-product-categories",
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
