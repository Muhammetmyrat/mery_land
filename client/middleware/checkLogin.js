// if (!auth) {
//   redirect("/admin/login");
// } else {
//   redirect("/admin/dashboard/homepage/slider");
// }
// import { mapGetters } from "vuex";
// export default {
//   mounted() {
//     console.log(check);
//   },
//   methods: {
//     check({ store, redirect }) {
//       const auth = isAuthenticated;
//       console.log(auth);
//     },
//   },
//   computed: {
//     ...mapGetters("admin", ["isAuthenticated"]),
//   },
// };
export default function ({ store, redirect }) {
  // If the user is not authenticated
  const auth = store.getters["admin/isAuthenticated"];
  if (!auth) {
    return redirect("/login");
  }
  // else {
  //   return redirect("/admin/homepage/slider");
  // }
}
