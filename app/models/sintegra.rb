class Sintegra < ActiveRecord::Base

  attr_accessor :organization, :year, :month


  def initialize(organization, month = Date.today.month, year = Date.today.year)
    #super(*args)
    self.organization = organization
    @file_name = "sintegra" + month.to_s.rjust(2,'0') + year.to_s + ".txt"
    #@date = date
    @initial_date = "2008-01-02".to_date
    @final_date = "2008-01-30".to_date
  end

  # Register 10 - Organization Informations 
  def generate_register_10( cnpj, state_registration, name, city, 
                            federation_unit, fax, initial_date, final_date, 
                            structure_identification_code, 
                            nature_identification_code, purpose_code )   
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N;
    string_register_10 = "10"
    # 2. CNPJ/MF 14 N;
    string_register_10 << cnpj.to_s.gsub(/\W/,'')[0..13].rjust(14,'0')
    # 3. State registration 14 A; 
    string_register_10 << state_registration.to_s.gsub(/\W/,' ')[0..13].ljust(14)
    # 4. Organization name 35 A;
    string_register_10 << name.to_s.gsub(/\W/,' ')[0..34].ljust(35)
    # 5. city 30 A; 
    string_register_10 << city.to_s.gsub(/\W/,' ')[0..29].ljust(30)
    # 6. Federation Unit 2 A; 
    string_register_10 << federation_unit.to_s[0..1].ljust(2)
    # 7. Fax 10 N;
    string_register_10 << fax.to_s.gsub(/\W/,'')[0..9].rjust(10,'0')
    # 8. Inital Date 8 N;
    string_register_10 << initial_date.to_s.delete('-')
    # 9. Final Date 8 N;
    string_register_10 << final_date.to_s.delete('-')
    # 10. Identification Code of File Structure 1 A;
    string_register_10 << structure_identification_code.to_s[0]
    # 11. Nature Identification Code 1 A;
    string_register_10 << nature_identification_code.to_s[0] 
    # 12. Purpose Code 1 A.
    string_register_10 << purpose_code.to_s[0] << "\n"
    return string_register_10;
  end

  # Register 11 - Organization Additional Inforamtions 
  def generate_register_11( public_park, number, complement, quarter, zip_code,
                            contact_name, phone )
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N;
    string = "11"
    # 2. Public Parck (Addres) 34 A;
    string << public_park.to_s.gsub(/\W/,' ')[0..33].ljust(34)
    # 3. Number 5 N;
    string << number.to_s.gsub(/\W/,'')[0..4].rjust(5,'0')
    # 4. Complement 22 A;
    string << complement.to_s.gsub(/\W/,' ')[0..21].ljust(22)
    # 5. Quarter 15 A;
    string << quarter.to_s.gsub(/\W/,' ')[0..14].ljust(15)
    # 6. Zip Code (CEP) 8 N;
    string << zip_code.to_s.gsub(/\W/,'')[0..7].rjust(8,'0')
    # 7. Contact Name 28 A;
    string << contact_name.to_s.gsub(/\W/,' ')[0..27].ljust(28)
    # 8. Phone 12 N.
    string << phone.to_s.gsub(/\W/,'')[0..11].rjust(12,'0') << "\n"
    return string
  end

  # Register 60 - Master (60M): Equipament Identifier 
  def generate_register_60M( issue_date, serial_numer, equipment_code, 
                             fiscal_model, document_first_number,
                             document_last_number, reduction_count_number,
                             operation_restart_count, raw_sale_value,
                             total_value )
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N;
    string = "60"
    # 2. Subtype 1 A;
    string << 'M'
    # 3. Issue date 8 N;
    string << issue_date.to_s.delete('-')
    # 4. Equipment Serial Number of Manufacturing 20 A;
    string << serial_numer.to_s.gsub(/\W/,'')[0..19].ljust(20)
    # 5. Number Attributed by The Organization to the Equipment 3 N;
    string << equipment_code.to_s.gsub(/\W/,'')[0..2].rjust(3,'0')
    # 6. Model Code of Fiscal Document 2 A;
    string << fiscal_model.to_s[0..1].ljust(2)
    # 7. Number of The First Fiscal Document at the Day 6 N;
    string << document_first_number.to_s.gsub(/\W/,'')[0..5].rjust(6,'0')
    # 8. Number of The Last Fiscal Document at the Day 6 N;
    string << document_last_number.to_s.gsub(/\W/,'')[0..5].rjust(6,'0')
    # 9. Counter's Number of Z Reduction (CRZ) 6 N;
    string << reduction_count_number.to_s.gsub(/\W/,'')[0..5].rjust(6,'0')
    # 10. Counter of Accumulated Value of Operation of Restart (CRO) 3 N;
    string << operation_restart_count.to_s.gsub(/\W/,'')[0..2].rjust(3,'0')
    # 11. Accumulated Value in the Totalizer of Raw Sale 16 N;
    string << raw_sale_value.to_s.gsub(/\W/,'')[0..15].rjust(16,'0')
    # 12. Accumulated Value in the General Totalizer 16 N;
    string << total_value.to_s.gsub(/\W/,'')[0..15].rjust(16,'0')
    # 13. Blanks 37 A;
    string << "".ljust(37,' ') << "\n"
    return string
  end

  # Register 60 - Analytical (60A): Identifier of each Tax Situation in the 
  # End of Day of each Fiscal Sender Equipment of Fiscal Coupom 
  def generate_register_60A(issue_date, equipment_serie, tax_identifier, value)
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N;
    string = "60" 
    # 2. Subtype 1 A;
    string << "A"
    # 3. Issue Date of Fiscal Documents 8 N;
    string << issue_date.to_s.delete('-')
    # 4. Equipment Serial Number of Manufacturing 20 A;
    string << equipment_serie.to_s.gsub(/\W/,'')[0..19].ljust(20)
    # 5. Identifier of Tax Situation 4 A;
    string << tax_identifier.to_s[0..3].ljust(4)
    # 6. Accumulated Value in the end of Day in the Totalizer of Tax Situation 12 N, with two decimals;
    value = (value.to_f * 100).floor
    string << value.to_s[0..11].rjust(12,'0')
    # 7. Blanks 79 A;
    string << "".ljust(79,' ') << "\n"
    return string
  end

  # Register 60 - Monthly Summary (60R)
  def generate_register_60R( issue_date, product, product_amount, 
                             product_value, icms_base, product_tax )
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N;
    string = "60"
    # 2. Subtype 1 A;
    string << "R"
    # 3. Issue Date of Fiscal Documents 6 N;
    string << issue_date.year.to_s << issue_date.month.to_s.rjust(2,'0')
    # 4. Product/Service Code of Organization 14 A;
    string << product.to_s.gsub(/\W/,'')[0..13].ljust(14)
    # 5. Product Amount in the month (with three decimals) 13 N;
    product_amount = (product_amount.to_f * 1000).floor
    string << product_amount.to_s[0..12].rjust(13,'0')
    # 6. Liquid Value of Product (with two decimals) 16 N;
    product_value = (product_value.to_f * 100).floor
    string << product_value.to_s[0..15].rjust(16,'0')
    # 7. Base of Calc ICMS - accumaleted value (with two decimals) 16 N; 
    icms_base = (icms_base.to_f * 100).floor
    string << icms_base.to_s[0..15].rjust(16,'0')
    # 8. Tax Situation of Product (with two decimals) 4 A;
    product_tax = (product_tax.to_f * 100).floor
    string << product_tax.to_s[0..3].ljust(4)
    # 9. Blanks 54 A;
    string << "".ljust(54,' ') << "\n"
    return string
  end

  # Register 50 - Fiscal Note
  def generate_register_50( cnpj, state_registration, issue_date, uf, model, 
                            serie, number, code_op, sender, total, base_icms,
                            icms, tax, others, aliquot, situation ) 
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N;
    string = "50"
    # 2. CNPJ 14 N;
    string << cnpj.to_s.gsub(/\W/,'')[0..13].rjust(14,'0')
    # 3. State Registration 14 A;
    string << state_registration.to_s.gsub(/\W/,'')[0..13].ljust(14)
    # 4. Issue or Receiver Date 8 N;
    string << issue_date.to_s.delete('-')
    # 5. Federation Unit 2 A;
    string << uf.to_s[0..1]
    # 6. Fiscal Note Model 2 N;
    string << model.to_s[0..1].rjust(2,'0')
    # 7. Serie of Fiscal Note 3 A;
    string << serie.to_s[0..2].ljust(3)
    # 8. Number of Fiscal Note 6 N;
    string << number.to_s[0..5].rjust(6,'0')
    # 9. Fiscal Code of Operation 4 N;
    string << code_op.to_s[0..3].rjust(4,'0')
    # 10. Fiscal Note Sender (P-proprio/T-terceiro) 1 A;
    string << sender.to_s[0]
    # 11. Total Value of Fiscal Note (with two decimals) 13 N;
    total = (total.to_f * 100).floor
    string << total.to_s[0..12].rjust(13,'0')
    # 12. Calc Base of ICMS (with two decimals) 13 N;
    base_icms = (base_icms.to_f * 100).floor
    string << base_icms.to_s[0..12].rjust(13,'0')
    # 13. ICMS Value (with two decimals) 13 N;
    icms = (icms.to_f * 100).floor
    string << icms.to_s[0..12].rjust(13,'0')
    # 14. Exempt or not Taxed 13 N;
    string << tax.to_s[0..12].rjust(13,'0')
    # 15. Others (with two decimals) 13 N;
    others = (others.to_f * 100).floor
    string << others.to_s[0..12].rjust(13,'0')
    # 16. Aliquot of ICMS (with two decimals) 4 N;
    aliquot = (aliquot.to_f * 100).floor
    string << aliquot.to_s[0..3].rjust(4,'0')
    # 17. Fiscal Note Situation 1 A;
    string << situation.to_s[0] << "\n"
    return string
  end

  # Register 54 - Product 
  def generate_register_54( cnpj, note_model, note_serie, note_number, 
                            fiscal_code, tax, item, product_code, 
                            product_amount, product_value, discount, icms_base,
                            icms_subst, ipi, icms )
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N;
    string = "54"
    # 2. CNPJ 14 N;
    string << cnpj.to_s.gsub(/\W/,'')[0..13].rjust(14,'0')
    # 3. Model Code of Fisca Note 2 N;
    string << note_model.to_s[0..1].rjust(2,'0')
    # 4. Fiscal Note Serie 3 A;
    string << note_serie.to_s[0..2].ljust(3)
    # 5. Number of Fiscal Note 6 N;
    string << note_number.to_s.gsub(/\W/,'')[0..5].rjust(6,'0')
    # 6. Fiscal Code of Operation 4 N;
    string << fiscal_code.to_s[0..3].rjust(4,'0')
    # 7. Tax Situation Code 4 A;
    string << tax.to_s[0..2].rjust(3,'0')  
    # 8. Order Number of Item 3 N;
    string << item.to_s[0..2].rjust(3,'0')
    # 9. Product Code of Organizaton 14 A;
    string << product_code.to_s.gsub(/\W/,'')[0..13].ljust(14)
    # 10. Product Amount (with three decimals) 11 N;
    product_amount = (product_amount.to_f * 1000).floor
    string << product_amount.to_s[0..10].rjust(11,'0')
    # 11. Product Value (with two decimals) 12 N;
    product_value = (product_value.to_f * 100).floor
    string << product_value.to_s[0..11].rjust(12,'0')
    # 12. Value of Discount (with two decimals) 12 N;
    discount = (discount.to_f * 100).floor
    string << discount.to_s[0..11].rjust(12,'0')
    # 13. Calc Base of ICMS (with two decimals) 12 N;
    icms_base = (icms_base.to_f * 100).floor
    string << icms_base.to_s[0..11].rjust(12,'0')
    # 14. Calc Base of ICMS for substituition (with two decimals) 12 N;
    icms_subst = (icms_subst.to_f * 100).floor
    string << icms_subst.to_s[0..11].rjust(12,'0')
    # 15. IPI Value (with two decimals) 12 N;
    ipi = (ipi.to_f * 100).floor
    string << ipi.to_s[0..11].rjust(12,'0') 
    # 16. ICMS Aliquot (with two decimals) 4 N;
    icms = (icms.to_f * 100).floor
    string << icms.to_s[0..3].rjust(4,'0') << "\n"
    return string
  end

  # Register 75 - Product or Service Code
  def generate_register_75( initial_date, final_date, product_code, 
                            nomenclature, product_description, unit, ipi, icms,
                            reduction_icms, base_icms )
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N; 
    string = "75"
    # 2. Initial Date 8 N;
    string << initial_date.to_s.delete('-')
    # 3. Final Date 8 N;
    string << final_date.to_s.delete('-')
    # 4. Product Code 14 A;
    string << product_code.to_s.gsub(/\W/,'')[0..13].ljust(14)
    # 5. Codification of Nomenclature in Mercosul 8 A;
    string << nomenclature.to_s.gsub(/\W/,' ')[0..7].ljust(8)
    # 6. Product Description 53 A;
    string << product_description.to_s.gsub(/\W/,' ')[0..52].ljust(53)
    # 7. Unit of Measure of Commercialization 6 A;
    string << unit.to_s.gsub(/\W/,'')[0..5].ljust(6)
    # 8. IPI Aliquot 5 N;
    string << ipi.to_s[0..4].rjust(5,'0')
    # 9. ICMS Aliquot 4 N;
    string << icms.to_s[0..3].rjust(4,'0')
    # 10. Reduction of Calc Base of ICMS 5 N;
    string << reduction_icms.to_s[0..4].rjust(5,'0')
    # 11. Calc Base of ICMS of Tax Substitution (with two decimals) 13 N;
    base_icms = (base_icms.to_f * 100).floor
    string << base_icms.to_s[0..12].rjust(13,'0') << "\n"
    return string
  end

  # Register 90 - File Totalization 
  def generate_register_90( cgc, registration, type, total, number )  
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N; 
    string = "90"
    # 2. Organization CGC 14 N;
    string << cgc.to_s.gsub(/\W/,'')[0..13].rjust(14,'0')
    # 3. State Registration 14 A;
    string << registration.to_s.gsub(/\W/,'')[0..13].ljust(14)
    # 4. Type for totalize 2 N;
    string << type.to_s[0..1].rjust(2,'0')
    # 5. Total of Registers 8 N;
    string << total.to_s[0..7].rjust(8,'0')
    # 6. Number of Type 90 Registers 1 N; 
    complatation_length = 126 - string.length
    string << number.to_s.rjust(complatation_length,' ') << "\n "
    return string
  end

  def generate_sintegra_ecf

    # Issue data of fical cupon
    issue_date = "2008-01-03".to_date

    # 1 Structure according to "Convenio ICMS 57/95" in the version of "Convenio ICMS 31/99"
    # 2 Structure according to "Convenio ICMS 57/95" in the version of "Convenio ICMS 69/02 e 142/02"
    # 3 Structure according to "Convenio ICMS 57/95" in the version of "Convenio ICMS 76/03"
    @structure_identification_code = 3

    # 1 Interstates only operations under Tax Replacement
    # 2 Interstates - operations with or without Tax Replacement
    # 3 Totality of the operations of the informant
    @nature_identification_code = 1

    # 1 Normal 
    # 2 Rectification total file: total replacement of information provided by the taxpayer for this period
    # 3 Rectification additive of file: addition of information not included in files already submitted
    # 5 Undoment file of information relating to transactions / services not effective. In this case, the file should contain, in addition to the record type 10 and type 90, only the records relating to operations / benefits not effective.
    @purpose_code = 1

    # Organization Information
    sintegra = generate_register_10(
      self.organization.cnpj, 
      self.organization.state_registration,
      self.organization.trade_name, 
      self.organization.address.city,
      self.organization.address.federation_unit,
      "33312299",
      @initial_date,
      @final_date, 
      @structure_identification_code,
      @nature_identification_code, 
      @purpose_code )
    # Complementary information of organization
    sintegra << generate_register_11( 
      self.organization.address.street,
      self.organization.address.number,
      self.organization.address.complement,
      self.organization.address.district,
      self.organization.address.zip_code,
      self.organization.responsible_person,
      "071-33312299" )
    # Must be generate for each equipment:
    # - One Register 60 Master for each day, informing total registred in each equipment.
    sintegra << generate_register_60M(
      issue_date, # issue date
      "12334567", # ecf serial number 
      "1", # Number assigned by the establishment to equipment
      "2D", # fiscal doc model - 2D for fiscal coupon
      "1", # COO for beginning of the day 
      "2", # COO for ending of the day
      "33", # CRZ number
      "444", # CRO 
      "44400", # Gross sale
      "444500") # General totalizer 
    sintegra << generate_register_60A(
      issue_date, # issue date
      "12334567", # ecf serial number 
      17, # ICMS Rate
      444.9) # Value accumulated at the end of the day on totalizer part of the tax situation / ICMS Rate
    # Must be generate for each equipment one record for each type of product or service processed in equipment Issuer of fiscal Coupon
    sintegra << generate_register_60R(
      issue_date, # issue date
      "123", # product code
      3, # product amount
      3.4, # product value
      3.4, # ICMS calculation base
      17) # ICMS rate
    sintegra << generate_register_90(
      self.organization.cnpj,
      self.organization.state_registration,
      60, # registers type
      3, # amount of registers
      1) # amount of registers 90
    return sintegra
  end

  def generate_all_registers 
    sintegra = generate_register_10( self.organization.cnpj, 
                          "444444444",
                          self.organization.name, 
                          "Salvador", 
                          "BA",
                          "33312299",
                          @initial_date,
                          @final_date, 
                          "1", 
                          "1",
                          '1')
    sintegra << generate_register_11( "Rua Caetano Moura",
                          "22",
                          "Ed. Norma Camozatto, Sala 301",
                          "Canela",
                          "40230200",
                          "Orivaldo Santana Jr",
                          "07133312299" )
    sintegra << generate_register_50( "05.359.933-0001/93",
                          "444444444",
                          @initial_date, 
                          "BA",
                          "55",
                          "A",
                          "222222",
                          "1234",
                          "P",
                          "131313",
                          "13131313",
                          "131313",
                          "13131313",
                          "131313",
                          "444",
                          "N")
    sintegra << generate_register_54( self.organization.cnpj,
                          "55",
                          "A",
                          "222222",
                          "1234",
                          "111",
                          "22",
                          123,
                          "1",
                          "2",
                          "4010",
                          "1220",
                          "5010",
                          "3010",
                          "222")
    sintegra << generate_register_60A(@initial_date, 
                          "222222",
                          "123",
                          "444")
    sintegra << generate_register_60M(@initial_date,
                          "12334567",
                          "123",
                          "55",
                          "1111",
                          "9999",
                          "33",
                          "444",
                          "444",
                          "4445")
    sintegra << generate_register_60R(@initial_date,
                          "123",
                          "5",
                          "6110",
                          "444",
                          "7445")
    sintegra << generate_register_75( @initial_date,
                          @final_date,
                          123,
                          "Produto",
                          "Produto vendido pela organizacao",
                          "kg",
                          "1230",
                          "1230",
                          "4220",
                          "1231231")
    sintegra << generate_register_90( self.organization.cnpj,
                          "898989",
                          "50",
                          "12",
                          "1")
    return sintegra
  end

  def generate_sintegra
    puts " -- test --"
    f = File.new(@file_name,"w")
    f.write(generate_sintegra_ecf)
    f.close 
    return true
  end

end



