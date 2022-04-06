<template>
  <AddContainer>
    <GoBackButton>Back</GoBackButton>
    <ContentBlock>
      <ContentBlockTitle>Slider goşmak</ContentBlockTitle>

      <ContentBlockForm>
        <!------------Change Photo------------->
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
          :placeHolder="'RU ady'"
        />
        <ContentBlockTextInput
          v-model="title.en"
          @updateInput="updateTitleEN"
          :placeHolder="'En ady'"
        />
        <ContentBlockTextInput
          v-model="count"
          @updateInput="updateCount"
          :placeHolder="'Update Count'"
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
  validate({ params }) {
    return /^\d+$/.test(params.id);
  },

  data() {
    return {
      lang_name: ["tr", "ru", "en"],
      title: {
        tr: "",
        ru: "",
        en: "",
      },
      count: "",
      arrTitle: [],
      dates_id: "",
      image: null,
    };
  },
  async mounted() {
    await this.fetchAuthToken();
    await this.fetchGetOneData({ url: `get-statistica/${this.id}` });
    await this.forInDates(this.getGetteredDates);
    await this.addNewElement();
  },
  //"get-home-sliders/74"
  async updated() {
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
    //Check and change dates in array
    changeTitle() {
      this.arrTitle[0] = this.title.tr;
      this.arrTitle[1] = this.title.ru;
      this.arrTitle[2] = this.title.en;
    },
    //Check and change dates in array
  },

  /*--------------------------------------------------- */
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
    async forInDates(some) {
      let Dates = some.data.data;
      this.image = Dates[0].image_path;
      this.count = Dates[0].amount;

      await this.forInOneTime(Dates, "title");

      for (let i in Dates) {
        this.dates_id = [...this.dates_id, Dates[i].id];
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
    updateCount(update) {
      this.count = update;
    },

    cycleInDates() {
      let formData = new FormData();
      formData.append("image", this.image);
      formData.append("statistica_id", this.id);
      formData.append("amount", this.count);

      this.arrTitle.forEach((item, index) => formData.append("title", item));

      this.dates_id.forEach((item, index) => formData.append("id", item));

      this.lang_name.forEach((item, index) =>
        formData.append("lang_name", item)
      );
      return formData;
    },

    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/

    //Take photo file and push it in data

    async addNewElement() {
      await this.$nuxt.$on("create", async () => {
        let Dates = await this.cycleInDates();

        this.deleteOrCreateOrUpdateOneData({
          url: "save-statistica",
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
