import places from 'places.js';

const initAutocomplete = () => {
  const eventAddressInput = document.getElementById('event_address');
  if (eventAddressInput) {
    places({ container: eventAddressInput });
  }
  const addressInput = document.getElementById('address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
