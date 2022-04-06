import clientModule from "./modules/client";
import adminModule from "./modules/admin";
export default {
  modules: {
    namespaced: true,
    client: clientModule,
    admin: adminModule,
  },
};
