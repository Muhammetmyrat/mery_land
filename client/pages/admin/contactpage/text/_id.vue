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
          v-model="contact_button"
          @updateInput="updateContact_button"
        />
        <ContentBlockTextInput
          v-model="contact_email"
          @updateInput="updateContact_email"
        />
        <ContentBlockTextInput
          v-model="contact_message"
          @updateInput="updateContact_message"
        />
        <ContentBlockTextInput
          v-model="contact_name"
          @updateInput="updateContact_name"
        />
        <ContentBlockTextInput
          v-model="contact_subject"
          @updateInput="updateContact_subject"
        />

        <!---------------------------->

        <ContentBlockTextInput v-model="title1" @updateInput="updateTitle1" />
        <ContentBlockTextInput v-model="title2" @updateInput="updateTitle2" />

        <ContentBlockTextArea v-model="text1" @updateTextarea="updateText1" />
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
      contact_button: "",
      contact_email: "",
      contact_message: "",
      contact_name: "",
      contact_subject: "",
      lang_name: "",
      text1: "",
      title1: "",
      title2: "",
    };
  },
  computed: {
    ...mapGetters("admin", ["getGetteredDates"]),

    id() {
      return this.$route.params.id;
    },
  },
  async mounted() {
    await this.fetchAuthToken();
    await this.fetchGetOneData({ url: `get-contact-body/${this.id}` });
    await this.forInDates(this.getGetteredDates);
    await this.addNewElement();
  },

  beforeDestroy() {
    this.destroyCreate();
  },
  methods: {
    ...mapActions("admin", [
      "fetchAuthToken",
      "deleteOrCreateOrUpdateOneData",
      "fetchGetOneData",
    ]),

    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/
    //Methods get info from Emits
    newsPhotoSelect(photo) {
      this.image = photo;
    },

    updateContact_button(update) {
      this.contact_button = update;
    },
    updateContact_email(update) {
      this.contact_email = update;
    },
    updateContact_message(update) {
      this.contact_message = update;
    },
    updateContact_name(update) {
      this.contact_name = update;
    },
    updateContact_subject(update) {
      this.contact_subject = update;
    },

    updateLang_name(update) {
      this.lang_name = update;
    },
    updateText1(update) {
      this.text1 = update;
    },

    updateTitle1(update) {
      this.title1 = update;
    },
    updateTitle2(update) {
      this.title2 = update;
    },

    //Treatment dates from State
    forInDates(some) {
      let Dates = some.data.data;
      this.image = Dates[0].image_path;
      this.contact_button = Dates[0].contact_button;
      this.contact_email = Dates[0].contact_email;
      this.contact_message = Dates[0].contact_message;
      this.contact_name = Dates[0].contact_name;
      this.contact_subject = Dates[0].contact_subject;
      this.lang_name = Dates[0].lang_name;
      this.text1 = Dates[0].text1;
      this.title1 = Dates[0].title1;
      this.title2 = Dates[0].title2;
    },

    //
    cycleInDates() {
      let formDates = new FormData();
      formDates.append("id", this.id);
      formDates.append("image", this.image);
      formDates.append("contact_button", this.contact_button);
      formDates.append("contact_email", this.contact_email);
      formDates.append("contact_message", this.contact_message);
      formDates.append("contact_name", this.contact_name);
      formDates.append("contact_subject", this.contact_subject);
      formDates.append("lang_name", this.lang_name);
      formDates.append("text1", this.text1);
      formDates.append("title1", this.title1);
      formDates.append("title2", this.title2);

      //formDates.append("partner", this.title);
      return formDates;
    },

    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/
    async addNewElement() {
      await this.$nuxt.$on("create", async () => {
        let Dates = await this.cycleInDates();

        this.deleteOrCreateOrUpdateOneData({
          url: "save-contact-body",
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
