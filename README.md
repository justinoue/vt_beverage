# vt_beverage
vt_beverage is a Rails 4 application for a single product ecommerce website with live statistics.

To run, clone the repo and simply run
```
bundle install
rails s
```
to install the required gems and get going.

The default database configuration expects MySQL with a database `vt_beverage`, user `vt_beverage` with password `vt_beverage`.

You can simulate site activity by running the following rake task
```
rake simulate_activity
```
