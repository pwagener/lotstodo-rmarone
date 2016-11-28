# Exercise: LotsToDo

The goal of this exercise is to explore building REST-ful APIs that may eventually be exposed to a **large scale**
of requests.  To have a fun discussion around this problem, you will build the simple API described below.  The
functionality of the API allows clients to create & track lists of `TODO` items assigned to a given `user`. 

In general, the API supports the following HTTP interactions:


HTTP Verb | Path | Description
:----------:|------|------------
POST | `/users` | Create a new User
GET | `/users/{user-id}` | Get a specific User
POST | `/users/{user-id}/todos` | Create a new TODO Item for a specific User
GET | `/users/{user-id}/todos` | Get the list of all TODO Items for a specific User
PUT | `/users/{user-id}/todos/{todo-id}` | Update the data in a specific TODO Item
DELETE | `/users/{user-id}/todos/{todo-id}` | Remove a specific TODO item

All requests and responses should use JSON for `Content-Type`.

## How To Build This
You are welcome to use whatever language(s), runtime(s), data store(s), and framework(s) you would like.  This should be 
fun. The end product just needs to be accessible via HTTP on the local network.  If you prefer to deploy to an external
service, that's great too.

Some considerations to factor into your choices here are:

- You should limit the time spent building the API to a few hours
- We will review the initial implementation together and discuss design trade offs 
- We will exercise your implementation with a reasonable scale of concurrent requests
- If it performs well, we will increase the scale of requests and discuss the impact

## Some Suggestions

To keep things simple, feel free to set some explicit limitations to the functionality of your implementation.  For
example, the following are all perfectly valid limitations:

- A `User` can be represented with an `id` and a `name`
- A `TODO Item` can be represented with an `id`, a `title`, a `body`, and a `done` flag
- No Authentication or Authorization
- A maximum number of 100 TODO items that can be associated with a given user
- No pagination for the list of TODO items

Have fun!