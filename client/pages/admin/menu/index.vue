<template>
  <Container>
    <!-- <MyButton :link="'menu/add'" :title="'Baş sahypa slider'">
      Taze Dili
    </MyButton> -->
    <Table>
      <thead>
        <tr>
          <TBodyTH> Dili </TBodyTH>
          <TBodyTH> Salgy </TBodyTH>
          <TBodyTH> Salgy </TBodyTH>
          <TBodyTH> Salgy </TBodyTH>
          <TBodyTH> Salgy </TBodyTH>
          <TBodyTH> Salgy </TBodyTH>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(item, index) in arr" :key="index">
          <TBodyTD>{{ item.lang_name }}</TBodyTD>
          <TBodyTD>{{ item.menu1 }}</TBodyTD>
          <TBodyTD>{{ item.menu2 }}</TBodyTD>
          <TBodyTD>{{ item.menu3 }}</TBodyTD>
          <TBodyTD>{{ item.menu4 }}</TBodyTD>
          <TBodyTD>{{ item.menu4 }}</TBodyTD>
          <TBodyIMG :img="item" />
          <TBodyFunction>
            <MyLink :link="`menu/${item.id}`" />
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
    await this.fetchDates("get-menu");
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
        url: "delete-menu",
        data: formDates,
      });
    },
  },
};
</script>
