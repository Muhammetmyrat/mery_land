<template>
  <AddContainer>
    <GoBackButton>Back</GoBackButton>
    <ContentBlock>
      <ContentBlockTitle>Slider goşmak</ContentBlockTitle>

      <ContentBlockForm>
        <!------------Text Input------------->
        <ContentBlockTextInput v-model="title1" @updateInput="updateTitle1" />
        <ContentBlockTextInput v-model="title2" @updateInput="updateTitle2" />
        <ContentBlockTextInput v-model="title3" @updateInput="updateTitle3" />
        <ContentBlockTextInput v-model="title4" @updateInput="updateTitle4" />
        <ContentBlockTextInput v-model="title5" @updateInput="updateTitle5" />

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
      lang_name: "",
      title1: "",
      title2: "",
      title3: "",
      title4: "",
      title5: "",
    };
  },

  async mounted() {
    await this.fetchAuthToken();
    await this.fetchGetOneData({ url: `get-footer-titles/${this.id}` });
    await this.forInDates(this.getGetteredDates);
    await this.addNewElement();
  },

  beforeDestroy() {
    this.destroyCreate();
  },
  computed: {
    ...mapGetters("admin", ["getGetteredDates"]),

    id() {
      return this.$route.params.id;
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

    forInDates(some) {
      let Dates = some.data.data[0];
      this.title1 = Dates.title1;
      this.title2 = Dates.title2;
      this.title3 = Dates.title3;
      this.title4 = Dates.title4;
      this.title5 = Dates.title5;
      this.lang_name = Dates.lang_name;
      return Dates;
    },

    updateTitle1(update) {
      this.title1 = update;
    },
    updateTitle2(update) {
      this.title2 = update;
    },
    updateTitle3(update) {
      this.title3 = update;
    },
    updateTitle4(update) {
      this.title4 = update;
    },
    updateTitle5(update) {
      this.title5 = update;
    },

    cycleInDates() {
      let formData = new FormData();
      formData.append("id", this.id);
      formData.append("lang_name", this.lang_name);
      formData.append("title1", this.title1);
      formData.append("title2", this.title2);
      formData.append("title3", this.title3);
      formData.append("title4", this.title4);
      formData.append("title5", this.title5);

      return formData;
    },

    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/

    async addNewElement() {
      await this.$nuxt.$on("create", async () => {
        let Dates = await this.cycleInDates();

        this.deleteOrCreateOrUpdateOneData({
          url: "save-footer-titles",
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
