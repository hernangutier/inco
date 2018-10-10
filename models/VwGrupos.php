<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "vw_grupos".
 *
 * @property int $id
 * @property string $grupo
 */
class VwGrupos extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'vw_grupos';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id'], 'integer'],
            [['grupo'], 'string', 'max' => 49],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'grupo' => 'Grupo',
        ];
    }
}
