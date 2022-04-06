<template>
  <section class="blog" id="blog">
    <div class="container">
      <div class="row" ref="observe">
        <div class="col-12">
          <div class="title text-center pClass">
            <h2>
              <span class="custon-underline">{{
                body_statistica_title && body_statistica_title.statistica_title
              }}</span>
            </h2>
          </div>
        </div>
        <article
          class="col-md-4 col-sm-6 col-xs-12 clearfix"
          v-for="(statisticAmount, i) in statisticsAmount"
          :key="i"
        >
          <div class="post-item">
            <div class="media-wrapper">
              <center>
                <img
                  style="width: 40%; height: 40%; margin-top: 20px"
                  :src="`${imgUrl}${statisticAmount.image_path}`"
                  alt=""
                  class="img-fluid"
                />
              </center>
            </div>
            <div class="content">
              <h1>
                <center class="counter" :data-target="statisticAmount.amount">0</center>
              </h1>
              <h3>
                <center>
                  {{ statisticAmount.title }}
                </center>
              </h3>
            </div>
          </div>
        </article>
      </div>
    </div>
  </section>
</template>

<script>
  export default {
    props: {
      statisticsAmount: {
        type: Array,
        default: () => [],
      },
      body_statistica_title: {
        type: Object,
        default: () => {},
      },
      imgUrl: {
        type: String,
        default: () => "",
      },
    },
    data() {
      return {
        observer: null,
        timeout: null,
      }
    },
    mounted() {
      const options =
        {
          rootMargin: "0px",
          threshold: 1.0,
        } || {}
      this.observer = new IntersectionObserver(([entry]) => {
        if (entry && entry.isIntersecting) {
          this.updateCount()
        }
      }, options)

      this.observer.observe(this.$refs.observe)
      //
    },
    destroyed() {
      this.observer.disconnect()
    },
    methods: {
      updateCount() {
        const counters = document.querySelectorAll(".counter")
        const speed = 200
        counters.forEach((counter) => {
          const update = () => {
            let target = +counter.getAttribute("data-target")
            let count = +counter.innerText
            let inc = target / speed
            if (count < target) {
              counter.innerText = Math.ceil(count + inc)
              setTimeout(update, 1)
            } else {
              counter.innerText = target
            }
          }
          counter.innerText = Number(0)
          update()
        })
      },
    },
  }
</script>
