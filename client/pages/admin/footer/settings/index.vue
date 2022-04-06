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
          <TBodyTH> Saýtyň logasy </TBodyTH>
          <TBodyTH> Saýtyň gara logasy </TBodyTH>
          <TBodyTH> Saýtyň favicony </TBodyTH>
          <TBodyTH> Saýtyň email adresi </TBodyTH>
          <TBodyTH> Saýtyň whatsapp belgisi </TBodyTH>
          <TBodyTH> Funksiyalar </TBodyTH>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(item, index) in arr" :key="index">
          <TBodyIMG3 :img="item" :keyImage="'logo'" />
          <TBodyIMG3 :img="item" :keyImage="'logo_black'" />
          <TBodyIMG3 :img="item" :keyImage="'favicon'" />
          <TBodyTD>{{ item.email }}</TBodyTD
          ><TBodyTD>{{ item.whatsapp }}</TBodyTD>
          <TBodyFunction>
            <MyLink :link="`settings/${item.id}`" />
            <!-- <TBodyButton :item="item" @remove="removeHomeSlider" /> -->
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
    await this.fetchDates("get-setings");
    await this.takeArr;
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
    //
    async removeHomeSlider(some) {
      this.arr = this.arr.filter((i) => i.id !== some.id);
      let formDates = new FormData();
      formDates.append("id", some.id);
      this.deleteOrCreateOrUpdateOneData({
        url: "delete-setings",
        data: formDates,
      });
    },
  },
};
</script>
