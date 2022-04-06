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
  head() {
    return {
      script: [
        { src: "/admin/ckeditor.js" },
        // { hid: "stripe", src: "/forCheck.js", defer: true },
      ],
    };
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
      image: null,
      imageName: "",
    };
  },
  async mounted() {
    await this.fetchAuthToken();
    await this.addNewElement();
  },
  async updated() {
    // await this.forTextarea();
    await this.changeTitle;
  },

  beforeDestroy() {
    this.destroyCreate();
  },

  computed: {
    //Check and change dates in array
    changeTitle() {
      this.arrTitle[0] = this.title.tr;
      this.arrTitle[1] = this.title.ru;
      this.arrTitle[2] = this.title.en;
    },
    //Check and change dates in array
  },

  //
  methods: {
    ...mapActions("admin", ["fetchAuthToken", "deleteOrCreateOrUpdateOneData"]),
    /*----------------Update titles-------------------*/

    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/
    //Methods get info from Emits
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
    /*----------------Update texts-------------------*/

    //This method do cycle in sliders arrays and push it in  new FormData

    cycleInDates() {
      let formData = new FormData();
      formData.append("image", this.image);
      formData.append("amount", this.count);

      this.lang_name.forEach((item, index) =>
        formData.append("lang_name", item)
      );

      this.arrTitle.forEach((item, index) => formData.append("title", item));

      return formData;
    },

    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/

    //Take photo file and push it in data

    //Take text-area in document and create check editor
    async forTextarea() {
      await ClassicEditor.create(document.querySelector("#editor"))
        .then((editor) => {
          console.log(i);
          console.log(editor);
        })
        .catch((error) => {
          console.error(error);
        });
    },

    //Take info from method cycleDates and use it in post fetch to API
    async addNewElement() {
      await this.$nuxt.$on("create", async () => {
        let Dates = await this.cycleInDates();

        this.deleteOrCreateOrUpdateOneData({
          url: "add-statistica",
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
