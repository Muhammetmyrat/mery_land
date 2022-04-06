<template>
  <AddContainer>
    <GoBackButton>Back</GoBackButton>
    <ContentBlock>
      <ContentBlockTitle>Slider goşmak</ContentBlockTitle>
      <ContentBlockForm>
        <ContentBlockPhoto @changePhoto="newsPhotoSelect" :img="image" />
        <!------------Text Input------------->
        <ContentBlockTextInput v-model="title" @updateInput="updateTitle" />
        <ContentBlockTextInput v-model="title" @updateInput="updateTitle" />
        <ContentBlockTextInput v-model="title" @updateInput="updateTitle" />
        <ContentBlockTextInput v-model="title" @updateInput="updateTitle" />
        <ContentBlockTextInput v-model="title" @updateInput="updateTitle" />
        <ContentBlockTextInput v-model="title" @updateInput="updateTitle" />
        <ContentBlockTextInput v-model="title" @updateInput="updateTitle" />
        <!------------Text Area------------->
        <ContentBlockTextArea v-model="title" @updateArea="updateTitle" />
        <!-- <ContentBlockTextInput v-model="title" @updateInput="updateTitle" /> -->
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
      title: "",
      title: "",
      title: "",
      title: "",
      title: "",
      title: "",
      title: "",
    };
  },
  async mounted() {
    await this.fetchAuthToken();
    await this.addNewElement();
  },
  methods: {
    ...mapActions("admin", ["fetchAuthToken", "deleteOrCreateOrUpdateOneData"]),
    /**--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/
    //Methods get info from Emits
    newsPhotoSelect(photo) {
      this.image = photo;
    },
    // updateTitle(update) {
    //   this.title = update;
    // },

    cycleInDates() {
      let formDates = new FormData();
      formDates.append("image", this.image);
      //formDates.append("partner", this.title);
      return formDates;
    },
    /**--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/
    async addNewElement() {
      await this.$nuxt.$on("create", async () => {
        let Dates = await this.cycleInDates();

        this.deleteOrCreateOrUpdateOneData({
          url: "add-contact-body",
          data: Dates,
        });
        console.log("ALL OK");
      });
    },
  },
};
</script>
