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
          :placeHolder="'Turkce ady'"
        />
        <ContentBlockTextInput
          v-model="title.ru"
          @updateInput="updateTitleRU"
          :placeHolder="'rusca ady'"
        />
        <ContentBlockTextInput
          v-model="title.en"
          @updateInput="updateTitleEN"
          :placeHolder="'inlisce ady'"
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
      service_id: "",
      dates_id: "",
      arrTitle: [],
      arrText: [],
    };
  },

  async mounted() {
    await this.fetchAuthToken();
    await this.fetchGetOneData({ url: `get-services/${this.id}` });
    await this.forInDates(this.getGetteredDates);
    await this.addNewElement();
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
    ...mapGetters("admin", ["getGetteredDates"]),

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
      "fetchGetOneData",
      "deleteOrCreateOrUpdateOneData",
    ]),

    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/
    forInOneTime(arr, key) {
      for (let i in arr) {
        this[key][arr[i].lang_name] = arr[i][key];
      }
    },
    forInDates(some) {
      let Dates = some.data.data;

      this.forInOneTime(Dates, "title");
      this.forInOneTime(Dates, "text");

      for (let i in Dates) {
        this.dates_id = [...this.dates_id, Dates[i].id];
      }

      this.image = Dates[0].image_path;
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

    cycleInDates() {
      let formData = new FormData();
      formData.append("image", this.image);
      formData.append("service_id", this.id);

      this.dates_id.forEach((item, index) => formData.append("id", item));

      this.lang_name.forEach((item, index) =>
        formData.append("lang_name", item)
      );

      this.arrTitle.forEach((item, index) => formData.append("title", item));

      this.arrText.forEach((item, index) => formData.append("text", item));

      return formData;
    },

    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/

    async addNewElement() {
      await this.$nuxt.$on("create", async () => {
        let Dates = await this.cycleInDates();

        this.deleteOrCreateOrUpdateOneData({
          url: "save-services",
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
