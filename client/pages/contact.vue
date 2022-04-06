<template>
  <span>
    <section
      class="single-page-header"
      :style="`height:400px; backgroundImage: url(${imgURL}${image_path})`"
    >
      <div class="container">
        <div class="row">
          <div class="col-md-12"></div>
        </div>
      </div>
    </section>
    <section class="contact-us" id="contact">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <div class="title text-center pClass">
              <h2>
                {{ contactTitle1 }}
              </h2>
              <client-only><span v-html="contactText1"></span></client-only>
              <div
                class="border"
                style="border: 2px solid#FF0000 !important"
              ></div>
            </div>
          </div>
          <div class="contact-details col-md-6">
            <h3 class="border-left-pr-col">
              {{ contactTitle2 }}
            </h3>
            <ul class="contact-short-info border-left-pr-col">
              <li>
                <i class="tf-ion-ios-home"></i>
                <span>{{ address }}</span>
              </li>
              <li>
                <i class="tf-ion-android-phone-portrait"></i>
                <span>
                  <a
                    style="color: black"
                    target="_blank"
                    v-for="phone in phones"
                    :key="phone.id"
                    :href="calculateContact(phone.phone_number, 'tel')"
                    >{{ phone.phone_number }}</a
                  >
                </span>
              </li>
              <li>
                <i class="tf-ion-android-globe"></i>
                <span>
                  <a
                    style="color: black"
                    target="_blank"
                    :href="calculateContact(whatsapp, 'whatsApp')"
                    >{{ whatsapp }}</a
                  >
                </span>
              </li>
              <li>
                <i class="tf-ion-android-mail"></i>
                <span>
                  <a
                    style="color: black"
                    target="_blank"
                    :href="calculateContact(email, 'mailto')"
                  >
                    {{ email }}
                  </a>
                </span>
              </li>
            </ul>
          </div>
          <Form
            :contact_name="contact_name"
            :contact_email="contact_email"
            :contact_subject="contact_subject"
            :contact_message="contact_message"
            :contact_button="contact_button"
            :report1="report1"
            :report2="report2"
            :contact="contact"
            :error="error"
            :loading="loading"
            :success="success"
            @contactUsFromChild="contactUsFromParent"
          />
        </div>
      </div>
    </section>
  </span>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
import Form from "@/components/Form.vue";
export default {
  head() {
    return {
      title: `${this.$t("contactPageTitle").toUpperCase()} | ${this.$t(
        "headTitle"
      )}`,
      meta: [
        {
          hid: "description",
          name: "description",
          content: this.$t("headTitle"),
        },
        {
          name: "keywords",
          content:
            "Maryland, Himiýa, Химия, Himiya, Turkmenistan, Tm, Туркменистан, ТМ",
        },
        {
          name: "author",
          content: "Salam Coding",
        },
      ],
    };
  },
  components: { Form },
  watch: {
    "$i18n.locale": async function () {
      await this.fetchContactBodyDatas({
        url: `${this.$i18n.locale}/contact-us`,
        $nuxt: this.$nuxt,
      });
    },
  },
  data() {
    return {
      error: false,
      success: false,
      loading: false,
      contact: {
        name: "",
        email: "",
        subject: "",
        message: "",
      },
    };
  },
  async fetch() {
    await this.fetchContactBodyDatas({
      url: `${this.$i18n.locale}/contact-us`,
      $nuxt: this.$nuxt,
    });
  },
  computed: {
    ...mapGetters("client", [
      "report1",
      "report2",
      "image_path",
      "contactTitle1",
      "contactText1",
      "contactTitle2",
      "email",
      "whatsapp",
      "address",
      "phones",
      "contact_name",
      "contact_email",
      "contact_subject",
      "contact_message",
      "contact_button",
      "imgURL",
    ]),
  },
  methods: {
    ...mapActions("client", ["fetchContactBodyDatas"]),
    calculateContact(data, text) {
      if (text == `tel`) {
        return `tel:${data}`;
      } else if (text == "whatsApp") {
        return `https://wa.me/${data}`;
      } else {
        return `mailto:${data}`;
      }
    },
    async contactUsFromParent(contact) {
      this.loading = true;
      const formData = new FormData();
      formData.append("name", contact.name);
      formData.append("email", contact.email);
      formData.append("subject", contact.subject);
      formData.append("message", contact.message);
      try {
        const res = await this.$axios.$post(`/contact/email`, formData, {
          headers: {
            "Content-Type": "application/json",
          },
        });
        if (res.status === false) {
          this.loading = false;
          this.error = true;
          setTimeout(() => {
            this.error = false;
          }, 4000);
        } else {
          this.loading = false;
          this.success = true;
          contact.name = "";
          contact.email = "";
          contact.subject = "";
          contact.message = "";
          setTimeout(() => {
            this.success = false;
          }, 4000);
        }
      } catch (e) {
        console.log(e);
      }
    },
  },
};
</script>

<style scoped>
</style>