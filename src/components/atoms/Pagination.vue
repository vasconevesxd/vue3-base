<template>
  <div class="min-w-max">
    <section class="flex justify-between px-10 py-3">
      <div class="flex items-center">
        <div class="pr-6" v-if="hasPrev()">
          <a href="#" @click.prevent="changePage(prevPage)">
            <div class="flex items-center justify-center h-6 w-6">
              <svg
                class="h-4 w-4"
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor">
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M15 19l-7-7 7-7" />
              </svg>
            </div>
          </a>
        </div>
        <div class="btn-group">
          <template v-if="hasFirst()">
            <a class="btn" href="#" @click.prevent="changePage(1)">1</a>
          </template>
          <template v-if="hasFirst()">
            <a class="btn btn-disabled">...</a>
          </template>

          <template v-for="page in pages">
            <a
              href="#"
              class="btn"
              :class="{ 'btn-active': current == page }"
              @click.prevent="changePage(page)"
              >{{ page }}</a
            >
          </template>
          <template v-if="hasLast()">
            <a class="btn btn-disabled">...</a>
          </template>
          <template v-if="hasLast()">
            <a href="#" class="btn" @click.prevent="changePage(totalPages)">{{ totalPages }}</a>
          </template>
        </div>
        <div class="pr-6" v-if="hasNext()">
          <a href="#" @click.prevent="changePage(nextPage)">
            <div class="flex items-center justify-center rounded-md h-6 w-6">
              <svg
                class="h-4 w-4"
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor">
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M9 5l7 7-7 7" />
              </svg>
            </div>
          </a>
        </div>
      </div>

      <div class="flex items-center">
        <div class="pr-2 text-gray-400 font-medium">
          <span id="text-before-input">
            {{ textBeforeInput }}
          </span>
        </div>
        <div class="w-14 rounded-md border border-indigo-400 px-1 py-1">
          <input v-model.number="input" class="w-12 focus:outline-none px-2" type="text" />
        </div>
        <div
          @click.prevent="changePage(input)"
          class="flex items-center pl-4 font-medium cursor-pointer">
          <span id="text-after-input">
            {{ textAfterInput }}
          </span>
          <svg
            class="h-4 w-4"
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor">
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M9 5l7 7-7 7" />
          </svg>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  name: 'Pagination',
  props: {
    current: {
      type: Number,
      default: 1
    },
    total: {
      type: Number,
      default: 0
    },
    perPage: {
      type: Number,
      default: 9
    },
    pageRange: {
      type: Number,
      default: 2
    },
    textBeforeInput: {
      type: String,
      default: 'Go to page'
    },
    textAfterInput: {
      type: String,
      default: 'Go'
    }
  },
  data() {
    return {
      input: ''
    }
  },
  methods: {
    hasFirst: function () {
      return this.rangeStart !== 1
    },
    hasLast: function () {
      return this.rangeEnd < this.totalPages
    },
    hasPrev: function () {
      return this.current > 1
    },
    hasNext: function () {
      return this.current < this.totalPages
    },
    changePage: function (page) {
      if (page > 0 && page <= this.totalPages) {
        this.$emit('page-changed', page)
      }
    }
  },
  computed: {
    pages: function () {
      var pages = []

      for (var i = this.rangeStart; i <= this.rangeEnd; i++) {
        pages.push(i)
      }

      return pages
    },
    rangeStart: function () {
      var start = this.current - this.pageRange
      start += 2
      return start > 0 ? start : 1
    },
    rangeEnd: function () {
      var end = this.current + this.pageRange

      return end < this.totalPages ? end : this.totalPages
    },
    totalPages: function () {
      return Math.ceil(this.total / this.perPage)
    },
    nextPage: function () {
      return this.current + 1
    },
    prevPage: function () {
      return this.current - 1
    }
  }
}
</script>
