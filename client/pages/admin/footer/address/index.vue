<template>
  <Container>
    <!-- <MyButton :link="'address/add'" :title="'Baş sahypa slider'">
      Taze Dili
    </MyButton> -->
    <div class="basic-tb-hd">
      <h2>Saýtyň nastroýkasy</h2>
    </div>
    <Table>
      <tr>
        <TBodyTH> Dili </TBodyTH>
        <TBodyTH> Salgy </TBodyTH>
        <TBodyTH> Funksiyalar </TBodyTH>
      </tr>
      <tbody>
        <tr v-for="(item, index) in arr" :key="index">
          <TBodyTD>{{ item.lang_name }}</TBodyTD>
          <TBodyTD>{{ item.address }}</TBodyTD>
          <TBodyFunction>
            <MyLink :link="`address/${item.id}`" />
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
    await this.fetchDates("get-address");
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
    async removeItem(item) {
      this.arr = this.arr.filter((i) => i.id !== item.id);
      let formDates = new FormData();
      formDates.append("id", item.id);

      this.deleteOrCreateOrUpdateOneData({
        url: "delete-address",
        data: formDates,
      });
    },
  },
};
</script>
