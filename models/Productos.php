<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "productos".
 *
 * @property int $id
 * @property string $ref
 * @property string $descripcion
 * @property string $und
 * @property string $costo
 * @property string $percent_utilidad
 * @property string $pvp
 * @property string $ref_fab
 * @property int $is_public
 * @property int $id_marca
 * @property int $id_grupo
 * @property int $min_venta
 * @property string $und_medida
 * @property int $e_in_inv
 * @property int $e_out_inv
 * @property int $id_ubic
 * @property Ubicaciones $ubic
 *
 * @property Marcas $marca
 * @property Grupos $grupo
 */
class Productos extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'productos';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['ref','descripcion'], 'required'],
            [['id', 'is_public', 'id_marca', 'id_grupo','min_venta','e_in_inv', 'e_out_inv'], 'integer'],
            [['costo', 'percent_utilidad', 'pvp'], 'number'],
            [['ref', 'und'], 'string', 'max' => 45],
            [['ref_fab'], 'string', 'max' => 10],
            [['descripcion'], 'string', 'max' => 400],
            [['ref'], 'unique'],
            [['id'], 'unique'],
            [['id_marca'], 'exist', 'skipOnError' => true, 'targetClass' => Marcas::className(), 'targetAttribute' => ['id_marca' => 'id']],
            [['id_grupo'], 'exist', 'skipOnError' => true, 'targetClass' => Grupos::className(), 'targetAttribute' => ['id_grupo' => 'id']],
            [['id_ubic'], 'exist', 'skipOnError' => true, 'targetClass' => Ubicaciones::className(), 'targetAttribute' => ['id_ubic' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'ref' => 'Código Catalogo',
            'descripcion' => 'Descripcion',
            'und' => 'Unidad de Medida',
            'costo' => 'Costo',
            'percent_utilidad' => '% Utilidad',
            'pvp' => 'Precio Sin/Iva',
            'is_public' => 'Publicado',
            'id_marca' => 'Marcas',
            'id_grupo' => 'Grupos de Inventario',
            'min_venta'=>'Minimo a Facturar',
            'e_in_inv' => 'Existencia en Sistema',
            'e_out_inv' => 'Existeencia fuera de Sistema',
            'id_ubic'=>'Ubicación',
            'ref_fab'=>'Referencia de Fabricante'
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMarca()
    {
        return $this->hasOne(Marcas::className(), ['id' => 'id_marca']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getGrupo()
    {
        return $this->hasOne(Grupos::className(), ['id' => 'id_grupo']);
    }

     /**
     * @return \yii\db\ActiveQuery
     */
    public function getUbic()
    {
        return $this->hasOne(Ubicaciones::className(), ['id' => 'id_ubic']);
    }

}
