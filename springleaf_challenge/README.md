# Payments Exercise

- Add in the ability to create payments for a given loan using a JSON API call. You should store the payment date and amount. **(commit: create payment model)**

- Expose the outstanding balance for a given loan in the JSON vended for `LoansController#show` and `LoansController#index`. The outstanding balance should be calculated as the `funded_amount` minus all of the payment amounts. **(commit: return outstanding balance on each serialized loan)**

- A payment should not be able to be created that exceeds the outstanding balance of a loan. You should return validation errors if a payment can not be created. **(commit: return an error if payment amount is larger than loan#outstanding_balance)**

- Expose endpoint for seeing all payments for a given loan **(commits: expose Payment#index endpoint, Payment#index returns all payments of a given loan)**

- Expose endpoint for seeing an individual payment. **(commit: expose Payment#show endpoint)**