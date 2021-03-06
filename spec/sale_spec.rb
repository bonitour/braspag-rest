require 'spec_helper'

describe BraspagRest::Sale do
  let(:braspag_response) {
    {
       'Payment' => {
          'ReasonMessage' => 'Successful',
          'Interest' => 'ByMerchant',
          'Links' => [
             {
                'Href' => 'https=>//apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/1ff114b4-32bb-4fe2-b1f2-ef79822ad5e1',
                'Method' => 'GET',
                'Rel' => 'self'
             },
             {
                'Method' => 'PUT',
                'Href' => 'https=>//apisandbox.cieloecommerce.cielo.com.br/1/sales/1ff114b4-32bb-4fe2-b1f2-ef79822ad5e1/capture',
                'Rel' => 'capture'
             },
             {
                'Rel' => 'void',
                'Href' => 'https=>//apisandbox.cieloecommerce.cielo.com.br/1/sales/1ff114b4-32bb-4fe2-b1f2-ef79822ad5e1/void',
                'Method' => 'PUT'
             }
          ],
          'ServiceTaxAmount' => 0,
          'Country' => 'BRA',
          'AcquirerTransactionId' => '0625101832104',
          'CreditCard' => {
             'ExpirationDate' => '12/2021',
             'SaveCard' => false,
             'Brand' => 'Visa',
             'CardNumber' => '000000******0001',
             'Holder' => 'Teste Holder'
          },
          'ReceivedDate' => '2015-06-25 10:18:32',
          'ProviderReturnCode' => '4',
          'ReasonCode' => 0,
          'ProofOfSale' => '1832104',
          'Capture' => false,
          'Provider' => 'Simulado',
          'Currency' => 'BRL',
          'ProviderReturnMessage' => 'Operation Successful',
          'Amount' => 15700,
          'Type' => 'CreditCard',
          'AuthorizationCode' => '058475',
          'PaymentId' => '1ff114b4-32bb-4fe2-b1f2-ef79822ad5e1',
          'Authenticate' => false,
          'Installments' => 1,
          'Recurrent' => false,
          'Status' => 1
       },
       'MerchantOrderId' => '18288',
       'Customer' => {
          'Name' => 'Comprador Teste'
       }
    }
  }

  let(:splitted_credit_card_payment_captured) {
    {
      'Payment' => {
        'ReasonMessage' => 'Successful',
        'Interest' => 'ByMerchant',
        'Links' => [
          {
            'Href' => 'https=>//apiqueryhomolog.braspag.com.br/v2/sales/1ff114b4-32bb-4fe2-b1f2-ef79822ad5e1',
            'Method' => 'GET',
            'Rel' => 'self'
          },
          {
            'Method' => 'PUT',
            'Href' => 'https=>//apihomolog.braspag.com.br/v2/sales/1ff114b4-32bb-4fe2-b1f2-ef79822ad5e1/capture',
            'Rel' => 'capture'
          },
          {
            'Rel' => 'void',
            'Href' => 'https=>//apihomolog.braspag.com.br/v2/sales/1ff114b4-32bb-4fe2-b1f2-ef79822ad5e1/void',
            'Method' => 'PUT'
          }
        ],
        'ServiceTaxAmount' => 0,
        'Country' => 'BRA',
        'AcquirerTransactionId' => '0625101832104',
        'Tid' => '1016101051753',
        'CreditCard' => {
          'ExpirationDate' => '12/2021',
          'SaveCard' => false,
          'Brand' => 'Visa',
          'CardNumber' => '000000******0001',
          'Holder' => 'Teste Holder'
        },
        'ReceivedDate' => '2015-06-25 10:18:32',
        'ProviderReturnCode' => '4',
        'ReasonCode' => 0,
        'ProofOfSale' => '1832104',
        'Capture' => false,
        'Provider' => 'Simulado',
        'Currency' => 'BRL',
        'ProviderReturnMessage' => 'Operation Successful',
        'Amount' => 10000,
        'BoletoNumber' => '2017091101',
        'CapturedAmount' => 10000,
        'Type' => 'SplittedCreditCard',
        'AuthorizationCode' => '058475',
        'PaymentId' => '1ff114b4-32bb-4fe2-b1f2-ef79822ad5e1',
        'Authenticate' => false,
        'Installments' => 1,
        'Recurrent' => false,
        'VoidedAmount' => 5000,
        'VoidedDate' => '2015-06-28 10:18:32',
        'Status' => 2,
        'SplitPayments' => [
          {
            'SubordinateMerchantId' => '20943d1a-153f-42b6-93b8-07b9db000651',
            'Amount' => 6000,
            'Fares' => {
              'Mdr' => 2,
              'Fee' => 30
            },
            'Splits' => [
              {
                'MerchantId' => '20943d1a-153f-42b6-93b8-07b9db000651',
                'Amount' => 5850
              },
              {
                'MerchantId' => 'abf26594-b758-4a69-841d-e254285f7068',
                'Amount' => 150
              }
            ]
          },
          {
            'SubordinateMerchantId' => 'a4133798-9fac-4592-b040-d62d8239bd97',
            'Amount' => 4000,
            'Fares' => {
              'Mdr' => 2,
              'Fee' => 30
            },
            'Splits' => [
              {
                'MerchantId' => 'a4133798-9fac-4592-b040-d62d8239bd97',
                'Amount' => 3890
              },
              {
                'MerchantId' => 'abf26594-b758-4a69-841d-e254285f7068',
                'Amount' => 110
              }
            ]
          }
        ],
        'Voids' => [
          {
            'Id' => 'xxx',
            'Amount' => 3000,
            'VoidedSplitPayments' => [
              {
                'SubordinateMerchantId' => '20943d1a-153f-42b6-93b8-07b9db000651',
                'VoidedAmount' => 3000,
                'VoidedSplits' => [
                  {
                    'MerchantId' => '20943d1a-153f-42b6-93b8-07b9db000651',
                    'VoidedAmount' => 2925
                  },
                  {
                    'MerchantId' => 'abf26594-b758-4a69-841d-e254285f7068',
                    'VoidedAmount' => 75
                  }
                ]
              }
            ]
          },
          {
            'Id' => 'xxx1',
            'Amount' => 2000,
            'VoidedSplitPayments' => [
              {
                'SubordinateMerchantId' => 'a4133798-9fac-4592-b040-d62d8239bd97',
                'VoidedAmount' => 2000,
                'VoidedSplits' => [
                  {
                    'MerchantId' => 'a4133798-9fac-4592-b040-d62d8239bd97',
                    'VoidedAmount' => 1950
                  },
                  {
                    'MerchantId' => '20943d1a-153f-42b6-93b8-07b9db000651',
                    'VoidedAmount' => 50
                  }
                ]
              }
            ]
          }
        ]
      },
      'MerchantOrderId' => '18288',
      'Customer' => {
         'Name' => 'Comprador Teste'
      }
    }
  }

  describe '.new' do
    subject(:sale) { BraspagRest::Sale.new(braspag_response) }

    it 'initializes a sale using braspag response format' do
      expect(sale.order_id).to eq('18288')
      expect(sale.payment).to be_an_instance_of(BraspagRest::Payment)
      expect(sale.customer).to be_an_instance_of(BraspagRest::Customer)
    end
  end

  describe '#save' do
    let(:attributes) {
      {
        order_id: 123456,
        customer: {
          name: 'Maria',
          identity: '790.010.515-88',
          identity_type: 'CPF',
          email: 'teste@teste.com.br',
          ip_address: '200.200.0.0',
          address: {
            street: 'Alameda Xingu',
            number: '512',
            complement: '27 andar',
            zip_code: '12345987',
            city: 'São Paulo',
            state: 'SP',
            country: 'BRA',
            district: 'Alphaville'
          },
          delivery_address: {
            street: 'Alameda Xingu',
            number: '512',
            complement: '27 andar',
            zip_code: '12345987',
            city: 'São Paulo',
            state: 'SP',
            country: 'BRA',
            district: 'Alphaville'
          },
          billing_address: {
            street: 'Alameda Xingu',
            number: '512',
            complement: '27 andar',
            zip_code: '12345987',
            city: 'São Paulo',
            state: 'SP',
            country: 'BRA',
            district: 'Alphaville'
          }
        },
        payment: {
          type: 'CreditCard',
          amount: 15700,
          provider: 'Simulado',
          installments: 1,
          soft_descriptor: 'MarketPlace Bonitour',
          credit_card: {
            number: '0000000000000001',
            holder: 'Maria',
            expiration_date: '12/2012',
            security_code: 123,
            brand: 'Visa'
          },
          fraud_analysis: {
            provider: 'ReDShield',
            browser: {
              ip_address: '200.200.0.0',
              browser_finger_print: 'browser_finger_print_token'
            },
            cart:{
              items: [{
                name: 'Item teste',
                merchant_item_id: '123',
                quantity: 1,
                unit_price: 1000,
                original_price: 1000,
                description: 'Descricao item teste'
                }]
            }
          }
        }
      }
    }

    before { allow(BraspagRest::Request).to receive(:authorize).and_return(response) }

    subject(:sale) { BraspagRest::Sale.new(attributes) }

    context 'when the gateway returns a successful response' do
      let(:parsed_body) {
        { 'Payment' => { 'Status' => 1, 'PaymentId' => '1ff114b4-32bb-4fe2-b1f2-ef79822ad5e1' } }
      }

      let(:response) { double(success?: true, parsed_body: parsed_body) }

      it 'returns true and fills the sale object with the return' do
        expect(sale.customer.identity).to_not be_nil
        expect(sale.customer.identity_type).to_not be_nil
        expect(sale.customer.email).to_not be_nil
        expect(sale.customer.ip_address).to_not be_nil

        expect(sale.payment.soft_descriptor).to_not be_nil
        expect(sale.payment.fraud_analysis.browser.ip_address).to_not be_nil
        expect(sale.payment.fraud_analysis.browser.browser_finger_print).to_not be_nil
        expect(sale.payment.fraud_analysis.cart.items).to_not be_empty

        expect(sale.customer).to be_an_instance_of(BraspagRest::Customer)
        expect(sale.payment).to be_an_instance_of(BraspagRest::Payment)
        expect(sale.payment.fraud_analysis).to be_an_instance_of(BraspagRest::FraudAnalysis)
        expect(sale.payment.fraud_analysis.browser).to be_an_instance_of(BraspagRest::FraudAnalyses::Browser)
        expect(sale.payment.fraud_analysis.cart).to be_an_instance_of(BraspagRest::FraudAnalyses::Cart)
        expect(sale.payment.fraud_analysis.cart.items).to be_an_instance_of(Array)
        expect(sale.payment.fraud_analysis.cart.items.first).to be_an_instance_of(BraspagRest::FraudAnalyses::Item)
        expect(sale.customer.address).to be_an_instance_of(BraspagRest::Address)
        expect(sale.customer.delivery_address).to be_an_instance_of(BraspagRest::Address)
        expect(sale.customer.billing_address).to be_an_instance_of(BraspagRest::Address)
        expect(sale.payment.credit_card).to be_an_instance_of(BraspagRest::CreditCard)

        expect(sale.save).to be_truthy
        expect(sale.payment.status).to eq(1)
        expect(sale.payment.id).to eq('1ff114b4-32bb-4fe2-b1f2-ef79822ad5e1')
      end
    end

    context 'when the gateway returns a failure' do
      let(:parsed_body) {
        [{ 'Code' => 123, 'Message' => 'MerchantOrderId cannot be null' }]
      }

      let(:response) { double(success?: false, parsed_body: parsed_body) }

      it 'returns false and fills the errors attribute' do
        expect(sale.save).to be_falsey
        expect(sale.errors).to eq([{ code: 123, message: "MerchantOrderId cannot be null" }])
      end
    end
  end

  describe '#cancel' do
    subject(:sale) { BraspagRest::Sale.new(request_id: 'xxx-xxx-xxx', payment: { id: 123, amount: 10000 }) }
    let(:void1) do
      BraspagRest::VoidSplitPayment.new(subordinate_merchant_id: 'a4133798-9fac-4592-b040-d62d8239bd97', voided_amount: 2000)
    end
    let(:void2) do
      BraspagRest::VoidSplitPayment.new(subordinate_merchant_id: '20943d1a-153f-42b6-93b8-07b9db000651', voided_amount: 3000)
    end
    let(:voids) do
      BraspagRest::Void.new(void_split_payments: [void1, void2])
    end

    context "when no amount and no voids are given" do
      let(:full_voided_sale_braspag_response) do
        braspag_response['Payment']['VoidedAmount'] = sale.payment.amount
        braspag_response['Payment']['VoidedDate'] = '2015-06-27 10:18:32'
        braspag_response
      end

      before do
        allow(BraspagRest::Request).to receive(:void).with('xxx-xxx-xxx', 123, nil, nil)
          .and_return(double(success?: true, parsed_body: {}))

        allow(BraspagRest::Request).to receive(:get_sale).and_return(double(parsed_body: full_voided_sale_braspag_response))
      end

      it 'calls braspag gateway with request_id, payment_id and no payment amount and voids' do
        expect(BraspagRest::Request).to receive(:void).with('xxx-xxx-xxx', 123, nil, nil).and_return(double(success?: true, parsed_body: {}))
        sale.cancel
      end

      it "updates the sale's voided amount with the full transaction amount" do
        sale.cancel
        expect(sale.payment.voided_amount).to eq(10000)
      end

      it "updates the sale's voided date" do
        sale.cancel
        expect(sale.payment.voided_date).to eq('2015-06-27 10:18:32')
      end

      it "reports success" do
        expect(sale.cancel).to be_truthy
      end
    end

    context 'when amount is given but no voids are given' do
      it 'raises BraspagRest::NoVoidsGiven' do
        expect { sale.cancel(5000) }.to raise_error(BraspagRest::NoVoidsGiven)
      end
    end

    context "when an amount and voids are given" do
      before do
        allow(BraspagRest::Request).to receive(:void).with('xxx-xxx-xxx', 123, 5000, voids)
          .and_return(double(success?: true, parsed_body: {}))

        allow(BraspagRest::Request).to receive(:get_sale).and_return(double(parsed_body: splitted_credit_card_payment_captured))
      end

      it 'calls braspag gateway with request_id, payment_id, amount and voids parameter' do
        expect(BraspagRest::Request).to receive(:void).with('xxx-xxx-xxx', 123, 5000, voids).and_return(double(success?: true, parsed_body: {}))
        sale.cancel(5000, voids)
      end

      it "updates the sale's voided amount with the requested refund amount" do
        sale.cancel(5000, voids)
        expect(sale.payment.voided_amount).to eq(5000)
      end

      it "updates the sale's voided date" do
        sale.cancel(5000, voids)
        expect(sale.payment.voided_date).to eq('2015-06-28 10:18:32')
      end

      it "reports success" do
        expect(sale.cancel(5000, voids)).to be_truthy
      end
    end

    context 'when the gateway returns a failure' do
      let(:parsed_body) {
        [{ 'Code' => 123, 'Message' => 'Amount cannot be null' }]
      }

      let(:response) { double(success?: false, parsed_body: parsed_body) }

      before { allow(BraspagRest::Request).to receive(:void).and_return(response) }

      it 'returns false and fills the errors attribute' do
        expect(sale.cancel).to be_falsey
        expect(sale.errors).to eq([{ code: 123, message: "Amount cannot be null" }])
      end
    end
  end

  describe '#capture' do
    subject(:sale) { BraspagRest::Sale.new(request_id: 'xxx-xxx-xxx', payment: { id: 123, amount: 1000 }) }

    it 'calls braspag gateway with request_id, payment_id and payment amount' do
      expect(BraspagRest::Request).to receive(:capture).with('xxx-xxx-xxx', 123, 1000).and_return(double(success?: true, parsed_body: {}))

      sale.capture
    end

    it 'calls braspag gateway with request_id, payment_id and amount parameter if it is not nil' do
      expect(BraspagRest::Request).to receive(:capture).with('xxx-xxx-xxx', 123, 500).and_return(double(success?: true, parsed_body: {}))

      sale.capture(500)
    end

    context 'when the gateway returns a successful response' do
      let(:parsed_body) {
        { 'Status' => 2 }
      }

      let(:response) { double(success?: true, parsed_body: parsed_body) }

      before { allow(BraspagRest::Request).to receive(:capture).and_return(response) }

      it 'returns true and fills the sale object with the return' do
        expect(sale.capture).to be_truthy
        expect(sale.payment.status).to eq(2)
        expect(sale.payment.id).to eq(123)
        expect(sale.payment.amount).to eq(1000)
      end
    end

    context 'when the gateway returns a failure' do
      let(:parsed_body) {
        [{ 'Code' => 123, 'Message' => 'Amount cannot be null' }]
      }

      let(:response) { double(success?: false, parsed_body: parsed_body) }

      before { allow(BraspagRest::Request).to receive(:capture).and_return(response) }

      it 'returns false and fills the errors attribute' do
        expect(sale.capture).to be_falsey
        expect(sale.errors).to eq([{ code: 123, message: "Amount cannot be null" }])
      end
    end
  end

  describe '.find' do
    before { allow(BraspagRest::Request).to receive(:get_sale).and_return(double(parsed_body: braspag_response)) }

    it 'calls braspag gateway with request_id and payment_id' do
      expect(BraspagRest::Request).to receive(:get_sale).with('xxx-xxx-xxx', 123).and_return(double(parsed_body: braspag_response))

      BraspagRest::Sale.find('xxx-xxx-xxx', 123)
    end

    it 'returns a populated sales object' do
      sale = BraspagRest::Sale.find('xxx-xxx-xxx', 123)
      expect(sale.order_id).to eq('18288')
      expect(sale.payment).to be_an_instance_of(BraspagRest::Payment)
      expect(sale.customer).to be_an_instance_of(BraspagRest::Customer)
      expect(sale.request_id).to eq('xxx-xxx-xxx')
    end
  end

  describe '.find_by_order_id' do
    let(:request_id) { SecureRandom.uuid }
    let(:order_id) { '1234567890' }

    before do
      allow(BraspagRest::Request).to receive(:get_sales_for_merchant_order_id).and_return(
        double(parsed_body: { 'Payments' => [{ 'PaymentId' => '1234567'}] })
      )

      allow(BraspagRest::Sale).to receive(:find).and_return BraspagRest::Sale.new
    end

    subject { BraspagRest::Sale.find_by_order_id(request_id, order_id) }

    it 'filters all sales for an order_id' do
      expect(BraspagRest::Request).to receive(:get_sales_for_merchant_order_id).with(request_id, order_id)
      subject
    end

    it 'returns a list of BraspagRest::Sale' do
      is_expected.to be_an Array
      expect(subject.all? { |payment| payment.is_a?(BraspagRest::Sale) }).to be_truthy
    end

    context 'when no result is returned' do
      before do
        allow(BraspagRest::Request).to receive(:get_sales_for_merchant_order_id).and_return(
          double(parsed_body: { 'Payments' => nil })
        )
      end

      it 'returns an empty list' do
        is_expected.to be_an Array
        is_expected.to be_empty
      end
    end
  end

  describe '#reload' do
    before { allow(BraspagRest::Request).to receive(:get_sale).and_return(double(parsed_body: braspag_response)) }

    it 'returns itself if request_id or payment_id is blank' do
      sale = BraspagRest::Sale.new
      expect(sale.reload).to eq(sale)

      sale.request_id = 'xxxx-xxxx-xxxx-xxx'
      expect(sale.reload).to eq(sale)

      sale.payment = { id: 123 }
      sale.request_id = nil
      expect(sale.reload).to eq(sale)
    end

    it 'returns a new object loaded from braspag find' do
      sale = BraspagRest::Sale.new(request_id: 'xxxxx-xxxxx-xxxxx-xxxxx', payment: { id: 123 })
      sale = sale.reload
      expect(sale.order_id).to eq('18288')
      expect(sale.payment).to be_an_instance_of(BraspagRest::Payment)
      expect(sale.customer).to be_an_instance_of(BraspagRest::Customer)
    end
  end
end
