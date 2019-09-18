<template>
  <div>
    <h1>User Table</h1>
    <button @click="newUser()" class="btn btn-info">Add User</button>
    <hr/>
    <table class="table">
      <thead class="thead-dark">
        <tr>
          <th scope="col">No.</th>
          <th scope="col">Name</th>
          <th scope="col">Phone</th>
          <th scope="col">Email</th>
          <th scope="col">edit</th>
          <th scope="col">delete</th>
        </tr>
      </thead>

      <tbody>
        <tr v-for="(user, index) in users" >
          <th scope="row">{{ index + 1 }}</th>
          <td>{{ user.name }}</td>
          <td>{{ user.phone }}</td>
          <td>{{ user.email }}</td>
          <td>
            <button @click="editUser(user.id)" class="btn btn-primary">
              <span class="btn-label"><i class="glyphicon glyphicon-edit"></i></span>
            </button>
          </td>
          <td>
            <button @click="deleteUser(user.id)" class="btn btn-danger">
              <span class="btn-label"><i class="glyphicon glyphicon-trash"></i></span>
            </button>            
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      users: []
    }
  },
  created: function() {
    this.fetchUserLists();
   },
 
  methods: {
    fetchUserLists: function() {
      const resource = this.$resource('/users.json/{ id }');
      resource.get().then(function(response){
        this.users = response.data
      });
    },
    deleteUser(user_id){
      this.$http.delete('users/'+ user_id +'.json')
      .then((res) => this.fetchUserLists())
      .catch((error) => console.log('Got a problem' + error));
    },
    editUser(user_id) {
      window.location = '/users/' + user_id + '/edit'
    },
    newUser(){
      window.location = '/users/new'
    }    
  }  
}
</script>