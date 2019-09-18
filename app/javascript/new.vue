<template>
  <div class="col-6 mx-auto">
    <div class="alert alert-warning" role="alert" v-if="msgs">
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>   
      <ul>
        <li v-for="item in msgs" :key="item">
          {{item}}
        </li>
      </ul>   
    </div>    
    <form method="post" action="#" @submit.prevent="handleSubmit">
      <div class="form-group">
        <label for="exampleInputPassword1">Name</label>
        <input type="text" class="form-control" id="exampleInputPassword1" v-model="name">
      </div> 
      <div class="form-group">
        <label for="exampleInputPassword1">Phone</label>
        <input type="text" class="form-control" id="exampleInputPassword1" v-model="phone">
      </div>       
      <div class="form-group">
        <label for="exampleInputEmail1">Email</label>
        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby= "emailHelp" v-model="email">
        <small id="emailHelp" class="form-text text-muted"></small>
      </div>
      <button type="submit" class="btn btn-primary">Submit</button>
      <a href="/users" class="btn btn-success">Back</a>
    </form>
  </div>
</template>
<script>
  export default {
    data: function () {
      return {
        name: 'Name',
        phone: '02-12345678',
        email: 'Email@email.com',
        msgs: null,
      }
    },
    computed: {
      formatURL: function() {
        return '/users/';
      }
    },
    methods: {
      handleSubmit: function () {
        this.$http.post(this.formatURL, {
          user: {
            name: this.name,
            phone: this.phone,
            email: this.email,
          }
        }).then((response) => {
          document.location.href = "/";
        }, (e) => {
          const msgs = Object.keys(e.body.message).reduce(function (acc, next) {
            return acc.concat(next + ' ' + e.body.message[next][0]);
          }, [])
          this.msgs = msgs;
        });
      }
    }
  }

</script>