<template>
  <section class="about-2 section" id="about">
    <div class="container">
      <div class="row">
        <!-- section title -->
        <div class="col-12">
          <div class="title text-center">
            <h2>
              <span class="custon-underline">{{
                body_text_firts_col && body_text_firts_col.title1
              }}</span>
            </h2>
            <div
              v-html="body_text_firts_col && body_text_firts_col.text1"
            ></div>
            <div class="border"></div>
          </div>
        </div>
        <!-- /section title -->

        <div class="col-md-6">
          <img src="/images/i-(9).jpg" class="img-fluid" alt="" />
        </div>
        <div class="col-md-6">
          <ul class="checklist checklist-custom-left-line">
            <li v-for="response in responses" :key="response.id">
              {{ response.title }}
            </li>
          </ul>
        </div>
      </div>
      <!-- End row -->
    </div>
    <!-- End container -->
  </section>
</template>

<script>
export default {
  props: {
    body_text_firts_col: {
      type: Object,
      default: () => {},
    },
    responses: {
      type: Array,
      default: () => [],
    },
    statistics: {
      type: Array,
      default: () => [],
    },
    imgURL: {
      type: String,
      default: () => "",
    },
  },
};
</script>