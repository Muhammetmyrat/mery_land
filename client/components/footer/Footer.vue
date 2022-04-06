<template>
  <footer id="footer" class="bg-one">
    <div class="top-footer">
      <div class="container">
        <div class="row">
          <div class="col-sm-3 col-md-3 col-lg-3">
            <h3>
              {{ title1 }}
            </h3>
            <p>
              {{ address }}
            </p>
          </div>
          <!-- End of .col-sm-3 -->

          <div class="col-sm-3 col-md-3 col-lg-3">
            <ul>
              <li>
                <h3>
                  {{ title2 }}
                </h3>
              </li>
              <li>
                <a
                  target="_blank"
                  v-for="phone in phones"
                  :key="phone.id"
                  :href="calculateContact(phone.phone_number, 'tel')"
                  >{{ phone.phone_number }}</a
                >
              </li>
              <li>
                <a
                  target="_blank"
                  :href="calculateContact(whatsapp, 'whatsapp')"
                  >{{ whatsapp }}</a
                >
              </li>
              <li>
                <a target="_blank" :href="calculateContact(email, 'mailto')">
                  {{ email }}
                </a>
              </li>
            </ul>
          </div>
          <!-- End of .col-sm-3 -->

          <div class="col-sm-3 col-md-3 col-lg-3">
            <ul>
              <li>
                <h3>
                  {{ title3 }}
                </h3>
              </li>
              <li>
                <a
                  href="#"
                  @click.prevent="$router.push(localeLocation('/'))"
                  >{{ menu1 }}</a
                >
                <a
                  href="#"
                  @click.prevent="$router.push(localeLocation('/about'))"
                  >{{ menu2 }}</a
                >
                <a
                  href="#"
                  @click.prevent="$router.push(localeLocation('/product'))"
                  >{{ menu4 }}</a
                >
                <a
                  href="#"
                  @click.prevent="$router.push(localeLocation('/contact'))"
                  >{{ menu3 }}</a
                >
              </li>
            </ul>
          </div>
          <!-- End of .col-sm-3 -->
        </div>
      </div>
      <!-- end container -->
    </div>
    <div class="footer-bottom">
      <h5>
        {{ title4 }}
      </h5>
      <h6>
        {{ title5 }}
        <a
          style="font-weight: bold; font-size: 15px; color: #cb0004"
          href="https://salamnews.site/"
          target="_blank"
          >Salam</a
        >
      </h6>
    </div>
  </footer>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
export default {
  watch: {
    "$i18n.locale": async function () {
      await this.fetchFooterDatas({
        url: `${this.$i18n.locale}/get-footer`,
        $nuxt: this.$nuxt,
      });
    },
  },
  async fetch() {
    await this.fetchFooterDatas({
      url: `${this.$i18n.locale}/get-footer`,
      $nuxt: this.$nuxt,
    });
  },
  computed: {
    ...mapGetters("client", [
      "title1",
      "title2",
      "title3",
      "title4",
      "title5",
      "menu1",
      "menu2",
      "menu3",
      "menu4",
      "menu5",
      "email",
      "whatsapp",
      "address",
      "phones",
    ]),
  },
  methods: {
    ...mapActions("client", ["fetchFooterDatas"]),
    calculateContact(data, text) {
      if (text == "tel") {
        return `tel:${data}`;
      } else if (text == "whatsapp") {
        return `https://wa.me/${data}`;
      } else {
        return `mailto:${data}`;
      }
    },
  },
};
</script>