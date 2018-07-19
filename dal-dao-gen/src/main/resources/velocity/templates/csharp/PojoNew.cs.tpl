using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data;
using Newtonsoft.Json;

namespace ${host.getNameSpace()}.Entity.DataModel
{
    /// <summary>
    /// ${host.getTableName()}
    /// </summary>
    [Serializable]
    [Table("${host.getTableName()}")]
    public partial class ${host.getClassName()}
    {
#foreach($column in $host.getColumns())
        /// <summary>
#if($column.getComment()!="")
		/// $!column.getComment()
#end
        /// </summary>
#if($column.isDataChangeLastTimeField())
        [Ignored]
#end
#if($column.isPrimary())
        [Key]
#end
        [Column("${column.getName()}")]
        [JsonProperty(PropertyName = "${column.getName()}")]
        public ${column.getType()}#if($column.isNullable() && $column.isValueType() && $column.getType() != "string")?#end #if($WordUtils.capitalize($column.getName()) == $host.getClassName())${host.getClassName()}_Gen#{else}${WordUtils.capitalize($column.getName())}#end { get; set; }
#end
    }
}