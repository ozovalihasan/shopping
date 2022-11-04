class IndexProductName < ActiveRecord::Migration[7.0]
  # An index can be created concurrently only outside of a transaction.
  disable_ddl_transaction!

  def up
    execute <<-SQL
      CREATE INDEX CONCURRENTLY products_on_name_idx ON products USING gin(name gin_trgm_ops);
    SQL
  end

  def down
    execute <<-SQL
      DROP INDEX products_on_name_idx;
    SQL
  end
end
