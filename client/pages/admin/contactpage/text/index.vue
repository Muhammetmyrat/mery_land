<template>
  <Container>
    <!-- <MyButton :link="'text/add'" :title="'Baş sahypa slider'">
      Taze Dili
    </MyButton> -->
    <div class="basic-tb-hd">
      <h2>Habarlaşmak sahypanyň sözleri we suraty</h2>
    </div>
    <Table>
      <thead>
        <tr>
          <TBodyTH> Dili</TBodyTH>
          <TBodyTH> Title - 1</TBodyTH>
          <TBodyTH> Title - 2</TBodyTH>
          <TBodyTH> Düwmäniň teksti</TBodyTH>
          <TBodyTH> Kontakt at yeri</TBodyTH>
          <TBodyTH> Kontakt email yeri</TBodyTH>
          <TBodyTH> Kontakt tema yeri</TBodyTH>
          <TBodyTH> Kontakt hat yeri</TBodyTH>
          <TBodyTH> Content</TBodyTH>
          <TBodyTH> Suraty</TBodyTH>
          <TBodyTH> Funcsiyalar</TBodyTH>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(item, index) in arr" :key="index">
          <TBodyTD>{{ item.lang_name }}</TBodyTD>
          <TBodyTD>{{ item.title1 }}</TBodyTD>
          <TBodyTD>{{ item.title2 }}</TBodyTD>
          <TBodyTD>{{ item.text1 }}</TBodyTD>
          <TBodyTD>{{ item.contact_name }}</TBodyTD>
          <TBodyTD>{{ item.contact_email }}</TBodyTD>
          <TBodyTD>{{ item.contact_message }}</TBodyTD>
          <TBodyTD>{{ item.contact_subject }}</TBodyTD>
          <TBodyTD>{{ item.contact_button }}</TBodyTD>
          <TBodyIMG :img="item" />
          <TBodyFunction>
            <MyLink :link="`text/${item.id}`" />
            <!-- <TBodyButton :item="item" @remove="removeItem" /> -->
          </TBodyFunction>
        </tr>
      </tbody>
    </Table>
  </Container>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
export default {
  layout: "admin",
  data() {
    return {
      arr: "",
    };
  },

  async mounted() {
    await this.fetchAuthToken();
    await this.fetchDates("get-contact-body");
    this.takeArr;
  },
  computed: {
    ...mapGetters("admin", ["getDates"]),
    takeArr() {
      this.arr = this.getDates;
      // console.log("ARR", this.arr);
    },
  },
  methods: {
    ...mapActions("admin", [
      "fetchAuthToken",
      "fetchDates",
      "deleteOrCreateOrUpdateOneData",
    ]),
    async removeItem(item) {
      this.arr = this.arr.filter((i) => i.id !== item.id);
      let formDates = new FormData();
      formDates.append("id", item.id);

      this.deleteOrCreateOrUpdateOneData({
        url: "delete-contact-body",
        data: formDates,
      });
    },
  },
};
</script>
