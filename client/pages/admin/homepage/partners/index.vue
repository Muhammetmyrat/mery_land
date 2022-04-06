<template>
  <Container>
    <MyButton :title="'Hyzmatdaşlar'" :link="'partners/add'"
      >Hyzmatdaş goş</MyButton
    >
    <Table>
      <thead>
        <tr>
          <TBodyTH> Hyzmatyň suraty</TBodyTH>
          <TBodyTH> Funksiyalar</TBodyTH>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(item, index) in arr" :key="index">
          <TBodyIMG :img="item" />
          <TBodyFunction>
            <MyLink :link="`partners/${item.id}`" />
            <TBodyButton :item="item" @remove="removeHomeSlider" />
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
    await this.fetchDates("get-partners");
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
    //
    async removeHomeSlider(some) {
      this.arr = this.arr.filter((i) => i.id !== some.id);
      let formDates = new FormData();
      formDates.append("id", some.id);
      this.deleteOrCreateOrUpdateOneData({
        url: "delete-partners",
        data: formDates,
      });
    },
  },
};
</script>
