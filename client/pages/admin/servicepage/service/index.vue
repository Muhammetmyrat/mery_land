<template>
  <Container>
    <MyButton :link="'service/add'" :title="'Hyzmatlar'"> Hyzmat goş </MyButton>
    <Table>
      <thead>
        <tr>
          <TBodyTH> Ady </TBodyTH>
          <TBodyTH> Maglumaty </TBodyTH>
          <TBodyTH> Suraty </TBodyTH>
          <TBodyTH> Funksiyalar </TBodyTH>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(item, index) in arr" :key="index">
          <TBodyTD>{{ item.title }}</TBodyTD>
          <TBodyTD>{{ item.text }}</TBodyTD>
          <TBodyIMG :img="item" />
          <TBodyFunction>
            <MyLink :link="`service/${item.id}`" />
            <TBodyButton :item="item" @remove="removeItem" />
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
    await this.fetchDates("get-services");
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
    async removeItem(item) {
      this.arr = this.arr.filter((i) => i.id !== item.id);
      let formDates = new FormData();
      formDates.append("id", item.id);

      this.deleteOrCreateOrUpdateOneData({
        url: "delete-services",
        data: formDates,
      });
    },
  },
};
</script>
