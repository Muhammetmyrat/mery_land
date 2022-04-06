<template>
  <div class="contact-form col-md-6">
    <div class="alert alert-success" v-if="success">
      <li class="text-center" style="list-style: none">{{ report1 }}</li>
    </div>
    <div class="alert alert-danger" v-if="error">
      <li class="text-center" style="list-style: none">{{ report2 }}</li>
    </div>
    <form method="post" role="form" @submit.prevent="contactUs">
      <div class="form-group">
        <input
          type="text"
          :placeholder="contact_name"
          class="form-control"
          name="text"
          v-model="contact.name"
          id="subject"
          required
        />
      </div>
      <div class="form-group">
        <input
          type="email"
          :placeholder="contact_email"
          class="form-control"
          name="email"
          v-model="contact.email"
          id="subject"
          required
        />
      </div>
      <div class="form-group">
        <input
          type="text"
          :placeholder="contact_subject"
          class="form-control"
          name="subject"
          v-model="contact.subject"
          id="subject"
          required
        />
      </div>
      <div class="form-group">
        <textarea
          rows="6"
          :placeholder="contact_message"
          class="form-control"
          v-model="contact.message"
          id="message"
          required
        ></textarea>
      </div>
      <div id="cf-submit">
        <input
          type="submit"
          id="contact-submit"
          class="btn btn-transparent"
          :value="loading ? loadingText : contact_button"
        />
      </div>
    </form>
  </div>
</template>

<script>
export default {
  props: {
    contact_name: {
      type: String,
      default: () => "",
    },
    contact_email: {
      type: String,
      default: () => "",
    },
    contact_subject: {
      type: String,
      default: () => "",
    },
    contact_message: {
      type: String,
      default: () => "",
    },
    contact_button: {
      type: String,
      default: () => "",
    },
    report1: {
      type: String,
      default: () => "",
    },
    report2: {
      type: String,
      default: () => "",
    },
    contact: {
      type: Object,
      default: () => {},
    },
    error: {
      type: Boolean,
      default: false,
    },
    success: {
      type: Boolean,
      default: false,
    },
    loading: {
      type: Boolean,
      default: false,
    },
  },
  data() {
    return {
      loadingText: this.$t("loading"),
    };
  },
  methods: {
    contactUs() {
      this.$emit("contactUsFromChild", this.contact);
    },
  },
};
</script>

<style scoped>
.contact-form input:focus {
  border-color: #c00f1a !important;
}
.contact-form textarea:focus {
  border-color: #c00f1a !important;
}
</style>