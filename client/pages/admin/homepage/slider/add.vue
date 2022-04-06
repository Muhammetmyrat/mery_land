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
        <!------------Text Area------------->
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
      text: {
        tr: "",
        ru: "",
        en: "",
      },
      sliderTitle: [],
      sliderText: [],
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
    await this.changeText;
  },

  beforeDestroy() {
    this.destroyCreate();
  },

  computed: {
    //Check and change dates in array
    changeTitle() {
      this.sliderTitle[0] = this.title.tr;
      this.sliderTitle[1] = this.title.ru;
      this.sliderTitle[2] = this.title.en;
    },
    //Check and change dates in array
    changeText() {
      this.sliderText[0] = this.text.tr;
      this.sliderText[1] = this.text.ru;
      this.sliderText[2] = this.text.en;
    },
  },

  //
  methods: {
    ...mapActions("admin", ["fetchAuthToken", "deleteOrCreateOrUpdateOneData"]),
    /*----------------Update titles-------------------*/

    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/

    updateTitleTR(update) {
      this.title.tr = update;
    },
    updateTitleRU(update) {
      this.title.ru = update;
    },
    updateTitleEN(update) {
      this.title.en = update;
    },
    /*----------------Update texts-------------------*/
    updateTextTR(update) {
      this.text.tr = update;
    },
    updateTextRU(update) {
      this.text.ru = update;
    },
    updateTextEN(update) {
      console.log("update", update);
      this.text.en = update;
    },

    //This method do cycle in sliders arrays and push it in  new FormData

    cycleInDates() {
      let formData = new FormData();
      formData.append("image", this.image);

      this.lang_name.forEach((item, index) =>
        formData.append("lang_name", item)
      );

      this.sliderTitle.forEach((item, index) => formData.append("title", item));

      this.sliderText.forEach((item, index) => formData.append("text", item));
      return formData;
    },

    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/

    //Take photo file and push it in data
    newsPhotoSelect(photo) {
      this.image = photo;
    },

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
          url: "add-home-sliders",
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
